<%@ WebHandler Language="C#" Class="MasterTabDiv" %>
using System;
using System.Web;
using System.Data;
using TF.WebPlatForm.DBUtils;
using TF.CommonUtility;
using TF.WebPlatForm.Logic;
using System.Text;
public class MasterTabDiv : IHttpHandler
{
    public void ProcessRequest (HttpContext context) {
        string strNavHtml = "";
        int nType = ObjectConvertClass.static_ext_int(context.Request["nType"]);
        string strParentID = ObjectConvertClass.static_ext_string(context.Request["strParentID"]);
        
        switch (nType) 
        {
            case 1:
                DataTable dtModule = getDtModule(strParentID);
                if (dtModule != null)
                {
                    strNavHtml = GetTopNavHtml(dtModule);
                }
                
                break;
            case 2:
                string strAbsoluteUrl =context.Request.Url.AbsolutePath;
                strNavHtml = GetLeftNavHtml(strParentID, strAbsoluteUrl);
                break;    
        }
        context.Response.ContentType = "text/html";
        context.Response.Write(strNavHtml);
        context.Response.End();
    }

    /// <summary>
    /// 功能：获取模块数据
    /// </summary>
    /// <param name="parentid"></param>
    /// <returns></returns>
    private DataTable getDtModule(string strParentID)
    {
        string RoleID = UserInformation.LoginUser.strRoleID;
        if (RoleID == null)
        {
            return null;
        }
        Module module = new Module(ConData.WebSiteConnectionString);

        if (RoleID.Trim().Length < 36)
        {
            DBUserRole dalUserRole = new DBUserRole(ConData.WebSiteConnectionString);
            TF.WebPlatForm.Entry.UserRole modelUserRole= dalUserRole.GetModel(new UserRoleQueryCondition { nID = ObjectConvertClass.static_ext_int(RoleID)});
            string strRoleID="";
            if(modelUserRole!=null)
            {
                strRoleID = modelUserRole.strID;
            }
            if (strRoleID != "")
            {
                RoleID = strRoleID;
            }
        }

        DataTable dt = module.GetDataSetModuleRole(RoleID);
        DataRow[] drTypes = dt.Select("nSource=1");//分类
        
        DataRow[] drPages = dt.Select("nSource=2");//页面
        DataTable dtPage = dt.Clone();  // 复制DataRow的表结构  
        foreach (DataRow drPage in drPages)
            dtPage.Rows.Add(drPage.ItemArray);  // 将DataRow添加到DataTable中  

        DataTable dtType2 = dt.Clone();
  
        //筛出2级分类
        foreach (DataRow drType in drTypes)
        {
            DataRow[] drs = dtPage.Select("strParentID='" + drType["strModuleID"].ToString() + "'");
            if (drs.Length > 0)
            {
                dtPage.Rows.Add(drType.ItemArray);               
            }
            else
            {
                dtType2.Rows.Add(drType.ItemArray);
            }
        }
        //筛出1级分类
        foreach (DataRow drType2 in dtType2.Rows)
        {
            DataRow[] drs2 = dtPage.Select("strParentID='" + drType2["strModuleID"].ToString() + "'");
            if (drs2.Length > 0)
            {
                dtPage.Rows.Add(drType2.ItemArray);
            }
        }

        DataTable dtNew = dtPage.Clone();         //复制数据源的表结构
        string strWhere = "";
        if(strParentID!="")
        {
            strWhere = "strParentID='" + strParentID + "'";
        }
        DataRow[] drNew = dtPage.Select(strWhere);  //strWhere条件筛选出需要的数据！
        for (int i = 0; i < drNew.Length; i++)
        {
            dtNew.Rows.Add(drNew[i].ItemArray);  // 将DataRow添加到DataTable中
        }
        return dtNew;
       // return module.GetModuleRole(UserLogin.LoginUser.strRoleID, strParentID);
    }

    /// <summary>
    /// 获取顶部导航栏html
    /// </summary>
    /// <param name="dt"></param>
    /// <returns></returns>
    private string GetTopNavHtml(DataTable dt)
    {
        StringBuilder strNav = new StringBuilder();
        foreach (DataRow dr in dt.Rows)
        {
            strNav.Append("<li name='TopNav'>");
            strNav.Append("<a id='" + ObjectConvertClass.static_ext_string(dr["strModuleID"]) + "' href='" + ObjectConvertClass.static_ext_string(dr["strURL"])
                + "' target='" + (dr["_blank"].ToString() == "1" ? "_blank" : "MainFrame") + "' onclick='TopNavClick(\"" +
                ObjectConvertClass.static_ext_string(dr["strModuleID"]) + "\",\"TopNav\")'><span class='icon " + ObjectConvertClass.static_ext_string(dr["strIconCss"]) 
                + "'></span>" + ObjectConvertClass.static_ext_string(dr["strUrlDescription"]) 
                + "</a>");
            strNav.Append("</li>");
        }
        return strNav.ToString();
    }

    /// <summary>
    /// 获取左侧导航栏html
    /// </summary>
    /// <param name="dt"></param>
    /// <returns></returns>
    private string GetLeftNavHtml(string strParentID, string strAbsoluteUrl)
    {
        DataTable dtAllLeftModule=getDtModule("");
        StringBuilder strNav = new StringBuilder();
        foreach (DataRow drAllLeftModule in dtAllLeftModule.Select("strParentID='" + strParentID+"'", "nsortid asc"))
        {
            DataRow[] drs = dtAllLeftModule.Select("strParentID='" + drAllLeftModule["strModuleID"].ToString()+"'", "nsortid asc");
            if (drs.Length > 0)
            {
                strNav.Append("<li><a class='" + drAllLeftModule["strIconCss"].ToString() + "' title='" + ObjectConvertClass.static_ext_string(drAllLeftModule["strUrlDescription"]) + "' href='#form" + drAllLeftModule["strModuleID"].ToString() + "'><div id='moduleDiv" + drAllLeftModule["strModuleID"].ToString() + "' name='ModuleNav'>" + TextClass.stringCut(ObjectConvertClass.static_ext_string(drAllLeftModule["strUrlDescription"]), 13) + "</div></a>");
                strNav.Append("<span class='arrow'></span>");
                strNav.Append("<ul id='form" + drAllLeftModule["strModuleID"].ToString() + "'>");
                foreach (DataRow dr in drs)
                {
                    strNav.Append("<li><a title='" + ObjectConvertClass.static_ext_string(dr["strUrlDescription"]) + "' name='LeftNav' " + (ObjectConvertClass.static_ext_string(dr["strURL"]) != HttpUtility.UrlDecode(strAbsoluteUrl) ? " href='" + dr["strURL"].ToString() + "'" : "href='#'") + " target='" + (dr["_blank"].ToString() == "1" ? "_blank" : "LeftFrame") + "'><div name='LeftNav' id='" + ObjectConvertClass.static_ext_string(dr["strModuleID"]) + "' onclick='BindLeftNavColor(this.id,\"LeftNav\",\"" + ObjectConvertClass.static_ext_string(dr["strParentID"]) + "\");'> " + TextClass.stringCut(ObjectConvertClass.static_ext_string(dr["strUrlDescription"]),13) + "</div></a></li>");
                }
                strNav.Append("</ul>");
            }
            else
            {
                strNav.Append("<li><a class='" + drAllLeftModule["strIconCss"].ToString() + "' name='LeftNav' " + (ObjectConvertClass.static_ext_string(drAllLeftModule["strURL"]) != HttpUtility.UrlDecode(strAbsoluteUrl) ? " href='" + drAllLeftModule["strURL"].ToString() + "'" : "href='#'") + " target='" + (drAllLeftModule["_blank"].ToString() == "1" ? "_blank" : "LeftFrame") + "'><div name='LeftNav' id='" + ObjectConvertClass.static_ext_string(drAllLeftModule["strModuleID"]) + "' onclick=\"BindLeftNavColor(this.id,'LeftNav','" + ObjectConvertClass.static_ext_string(drAllLeftModule["strParentID"]) + "');\"> " + TextClass.stringCut(ObjectConvertClass.static_ext_string(drAllLeftModule["strUrlDescription"]),13) + "</div></a></li>");
            }
            strNav.Append("</li>");
        }
        return strNav.ToString();
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}
<%@ WebHandler Language="C#" Class="WebPlatForm_UserRole" %>

using System;
using System.Web;
using TF.CommonUtility;
using TF.WebPlatForm.Logic;
using System.Data;
using TF.WebPlatForm.DBUtils;

public class WebPlatForm_UserRole : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string strFun = ObjectConvertClass.static_ext_string(context.Request["strFun"]);
        if (strFun != "")
        {
            switch (strFun)
            {
                case "GetTreeList"://获取角色模块信息
                    {
                        GetTreeList(context);
                        break;
                    }
                case "GetRolePower"://获取角色权限
                    {
                        GetRolePower(context);
                        break;
                    }
                case "delete":
                    {
                        Delete(context);
                        break;
                    }
                case "Get":
                    {
                        Get(context);
                        break;
                    }
            }
        }
    }

    /// <summary>
    ///  查询
    /// </summary>
    /// <param name="context"></param>
    /// <returns></returns>
    private void Get(HttpContext context)
    {
        string strRtn = "";
        UserRoleQueryCondition userRoleQueryCondition = new UserRoleQueryCondition();
        userRoleQueryCondition.page = ObjectConvertClass.static_ext_int(context.Request["page"]);
        userRoleQueryCondition.rows = ObjectConvertClass.static_ext_int(context.Request["rows"]);
        userRoleQueryCondition.strName = ObjectConvertClass.static_ext_string(context.Request["strName"]);
        //实例化WebPlatForm_UserRole数据操作类
        DBUserRole dBUserRole = new DBUserRole(ConData.WebSiteConnectionString);
        DataTable dtTAB_UserRole = dBUserRole.GetDataTable(userRoleQueryCondition);
        int nCount = dBUserRole.GetDataCount(userRoleQueryCondition);
        strRtn=JsonConvert.SerializeP(dtTAB_UserRole, nCount);
        context.Response.ContentType = "application/json";
        context.Response.Write(strRtn);
        context.Response.End();
    }
    
    /// <summary>
    /// 删除
    /// </summary>
    /// <param name="parameters"></param>
    /// <returns></returns>
    private void Delete(HttpContext context)
    {
        string strRtn = "false";
        string parameters =ObjectConvertClass.static_ext_string(context.Request["parameters"]);
        DBUserRole dBTAB_UserRole = new DBUserRole(ConData.WebSiteConnectionString);
        if (dBTAB_UserRole.Delete(parameters))
        {
            DBTAB_Module_Relation dalRelation = new DBTAB_Module_Relation(ConData.WebSiteConnectionString);
            dalRelation.DeleteForRoleID(parameters);
            strRtn= "true";
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write(strRtn);
        context.Response.End();
    }
    /// <summary>
    ///  获取角色权限
    /// </summary>
    /// <param name="context"></param>
    /// <returns></returns>
    private void GetRolePower(HttpContext context)
    {
        string strSelRoles = "'" + ObjectConvertClass.static_ext_string(context.Request["selRoles"]).Replace(",", "','") + "'";
        DBTAB_Module_Relation dal = new DBTAB_Module_Relation(ConData.WebSiteConnectionString);        
        DataTable dt= dal.GetDataTableRolePower(strSelRoles);
        context.Response.ContentType = "application/json";
        context.Response.Write(JsonConvert.Serialize(dt));
        context.Response.End();
    }
    /// <summary>
    ///  查询页面配置
    /// </summary>
    /// <param name="context"></param>
    /// <returns></returns>
    private void GetTreeList(HttpContext context)
    {
        string strRoleID = ObjectConvertClass.static_ext_string(context.Request["strRoleID"]);
        DBModule_Information dal = new DBModule_Information(ConData.WebSiteConnectionString);
        DataSet ds = dal.GetDataTablePageRole(strRoleID);
        DataTable dt = ds.Tables[0];
        DataTable dtPower = ds.Tables[1];
        DataTable dtRelation = ds.Tables[2];

        System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        string str = "";
        int i = 0;
        str = "[";
        foreach (DataRow dr in dt.Rows)
        {
            if (i > 0) str = str + ",";

            str = str + "{";
            str = str + "\"id\":" + serializer.Serialize(dr["strID"]) + ",";
            str = str + "\"text\":" + serializer.Serialize(dr["strModuleName"]) + ",";
            str = str + "\"strPowerID\":\"\",";
            str = str + "\"strModuleID\":" + serializer.Serialize(dr["strID"].ToString()) + ",";
            str = str + "\"nLevel\":\"1\"";
            
            //过滤出模块权限
            DataRow[] drPowers = dtPower.Select( "[strModuleID] ='" + ObjectConvertClass.static_ext_string(dr["strID"]) + "'");
            if (drPowers.Length>0)
            {
                int j = 0;
                str=str+ ",\"children\":[";
                foreach(DataRow drPower in drPowers)
                {
                    if (j > 0) str = str + ",";
                    str = str + "{";
                    str = str + "\"id\":" + serializer.Serialize(drPower["strID"]) + ",";
                    str = str + "\"text\":" + serializer.Serialize(drPower["strPowerName"]) + ",";
                    str = str + "\"strURL\":\"\",";
                    str = str + "\"strPowerID\":" + serializer.Serialize(drPower["strPowerID"].ToString()) + ",";
                    str = str + "\"strModuleID\":" + serializer.Serialize(drPower["strModuleID"].ToString()) + ",";
                    if (ObjectConvertClass.static_ext_int(drPower["ncount"]) > 0) str = str + "\"checked\":true,";
                    str = str + "\"nLevel\":\"2\"";
                    str = str + "}";
                    j=j+1;
                }
                str = str + "]";
            }
            else
            {
                DataRow[] drRelations = dtRelation.Select("[strModuleID] ='" + ObjectConvertClass.static_ext_string(dr["strID"]) + "' and strPowerID='' ");
                if (drRelations.Length > 0)
                {
                    str = str + ",\"checked\":true";
                }
            }

            str = str + "}";
            i = i + 1;          
        }
        str = str + "]";
      

        context.Response.ContentType = "application/json";
        context.Response.Write(str);
        context.Response.End();
      
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
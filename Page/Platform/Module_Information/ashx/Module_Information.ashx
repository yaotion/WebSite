<%@ WebHandler Language="C#" Class="httpModule_Information" %>
	
using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Generic;
using TF.CommonUtility;
using TF.WebPlatForm.DBUtils;
using TF.WebPlatForm.Logic;
using TF.WebPlatForm.Entry;

/// <summary>
/// Module_Information模块处理程序
/// </summary>
public class httpModule_Information : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        string strFun = ObjectConvertClass.static_ext_string(context.Request["strFun"]);
        if (strFun != "")
        {
            switch (strFun)
            {
                case "GetPageConfig"://查询页面配置
                    {
                        GetPageConfig(context);
                        break;
                    }
                case "GetTreeList"://获取模块树形
                    {
                        GetTreeList(context);
                        break;
                    }
                case "Delete"://删除
                    {
                        Delete(context);
                        break;
                    }
                case "UpdateTopNav"://更新默认首页
                    {
                        UpdateTopNav(context);
                        break;
                    }
                case "GetRoleModule"://根据角色获取拥有模块权限
                    {
                        GetModuleInfomationByRole(context);
                        break;
                    }
            }
        }
        
        //string parameters = ObjectConvertClass.static_ext_string(context.Request["parameters"]);
        //// 返回的json字符串
        //string strReturnJson = "";
        //if (parameters != "")
        //{

        //    strReturnJson = Delete(parameters);
        //}
        //else
        //{
        //    if (ObjectConvertClass.static_ext_int(context.Request["GetRoleModule"]) == 1)
        //    {
        //        strReturnJson = GetModuleInfomationByRole();
        //    }
        //    else
        //    {
        //        string strTopNav = ObjectConvertClass.static_ext_string(context.Request["strTopNav"]);
        //        if (strTopNav != "")
        //        {
        //            UpdateTopNav(strTopNav);
        //        }
        //        strReturnJson = Get(context);
        //    }
        //}
        //context.Response.ContentType = "application/json";
        //context.Response.Write(strReturnJson);
        //context.Response.End();


    }

    /// <summary>
    ///  获取模块树形
    /// </summary>
    /// <param name="context"></param>
    /// <returns></returns>
    private void GetTreeList(HttpContext context)
    {
        Module_InformationQueryCondition Condition = new Module_InformationQueryCondition();
        Condition.strParentIDNotNull = "true";
        Condition.sort = "nsortid";
        Condition.order = "asc";
        //实例化httpModule_Information数据操作类
        DBModule_Information dal = new DBModule_Information(ConData.WebSiteConnectionString);
        DataTable dt = dal.GetDataTable(Condition);
        if (dt != null)
        {
            if (dt.Rows.Count == 0)
            {
                DataRow dr = dt.NewRow();
                dr["nID"] = "0";
                dr["strID"] = "1";
                dr["strURL"] = "";
                dr["strUrlDescription"] = "";
                dr["strParentID"] = "0";
                dr["nsortid"] = "0";
                dr["_blank"] = "0";
                dr["strIconCss"] = "";
                dr["nEnable"] = "1";
                dr["nSource"] = "1";
                dt.Rows.Add(dr);
            }
        }
        int nCount = dal.GetDataCount(Condition);
        nCount = nCount == 0 ? 1 : nCount;
        string strjson = JsonConvert.SerializeP(dt, nCount).Replace("strID", "id").Replace("strParentID", "_parentId").Replace(",\"_parentId\":\"0\"", "");

        context.Response.ContentType = "application/json";
        context.Response.Write(strjson);
        context.Response.End();
    }
    /// <summary>
    ///  查询页面配置
    /// </summary>
    /// <param name="context"></param>
    /// <returns></returns>
    private void GetPageConfig(HttpContext context)
    {
        string strModuleID = ObjectConvertClass.static_ext_string(context.Request["strModuleID"]);
        DBModule_Information dal = new DBModule_Information(ConData.WebSiteConnectionString);
        DataTable dt = dal.GetDataTablePageConfig(strModuleID);

        context.Response.ContentType = "application/json";
        context.Response.Write(JsonConvert.SerializeP(dt, dt.Rows.Count));
        context.Response.End();
    }
    
    ///// <summary>
    /////  查询
    ///// </summary>
    ///// <param name="context"></param>
    ///// <returns></returns>
    //private string Get(HttpContext context)
    //{

    //    Module_InformationQueryCondition Condition = new Module_InformationQueryCondition();
    //    Condition.sort = "nsortid";
    //    Condition.order = "asc";
    //    //实例化httpModule_Information数据操作类
    //    DBModule_Information dal = new DBModule_Information(ConData.WebSiteConnectionString);
    //    DataTable dt = dal.GetDataTable(Condition);
    //    if (dt != null)
    //    {
    //        if (dt.Rows.Count == 0)
    //        {
    //            DataRow dr = dt.NewRow();
    //            dr["nID"] = "0";
    //            dr["strID"] = "1";
    //            dr["strURL"] = "";
    //            dr["strUrlDescription"] = "";
    //            dr["strParentID"] = "0";
    //            dr["nsortid"] = "0";
    //            dr["_blank"] = "0";
    //            dr["strIconCss"] = "";
    //            dr["nEnable"] = "1";
    //            dr["nSource"] = "1";
    //            dt.Rows.Add(dr);
    //        }
    //    }
    //    int nCount = dal.GetDataCount(Condition);
    //    nCount = nCount == 0 ? 1 : nCount;
    //    string strjson = JsonConvert.SerializeP(dt, nCount).Replace("strID", "id").Replace("strParentID", "_parentId").Replace(",\"_parentId\":\"0\"", "");
    //    return strjson;
    //}

    /// <summary>
    /// 根据角色获取模块信息
    /// </summary>
    /// <returns></returns>
    private void GetModuleInfomationByRole(HttpContext context)
    {
        Module module = new Module(ConData.WebSiteConnectionString);
        DataTable dt = module.GetDataSetModuleRole(UserInformation.LoginUser.strRoleID);
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
        string strReturnJson = JsonConvert.SerializeP(dtPage, dtPage.Rows.Count).Replace("strModuleID", "id").Replace("strParentID", "_parentId").Replace(",\"_parentId\":\"1\"", "");
        context.Response.ContentType = "application/json";
        context.Response.Write(strReturnJson);
        context.Response.End();
    }

    /// <summary>
    /// 删除
    /// </summary>
    /// <param name="context"></param>
    /// <returns></returns>
    private void Delete(HttpContext context)
    {
        string strRtn = "false";
        string parameters = ObjectConvertClass.static_ext_string(context.Request["parameters"]);
        DBModule_Information dal = new DBModule_Information(ConData.WebSiteConnectionString);
        DBTAB_Module_Relation dalRelation = new DBTAB_Module_Relation(ConData.WebSiteConnectionString);
        //删除模块及其分类更新模块下的页面父节点为空
        DataTable dt = dal.GetDataTable(new Module_InformationQueryCondition());
        if (DeleteTreeType(dt, parameters, 1, "strParentID", "strID") == "")
        {
            dalRelation.DeleteByModuleID(parameters);
            dal.Delete(parameters);
            strRtn= "true";
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write(strRtn);
        context.Response.End();
    }

    /// <summary>
    ///  无限递归，删除分类
    /// </summary>
    /// <param name="dt">datatable数据</param>
    /// <param name="ParentID">起始父ID</param>
    /// <param name="deep">开始深度，默认为1</param>
    /// <param name="strParentName">父节点id列名</param>
    /// <param name="strnTypeIDName">节点id列名</param>
    /// <returns></returns> 
    public string DeleteTreeType(DataTable dt, string ParentID, int deep, string strParentName, string strnTypeIDName)
    {
        DataView dvTree = new DataView(dt);
        dvTree.RowFilter = "[" + strParentName + "]   ='" + ParentID + "'";//过滤出ParentId  
        string str = "";
        int d = deep;
        foreach (DataRowView drv in dvTree)
        {
            DBModule_Information dal = new DBModule_Information(ConData.WebSiteConnectionString);
            if (drv["nSource"].ToString() == "1")
            {
                str = str + DeleteTreeType(dt, drv[strnTypeIDName].ToString(), deep + 1, strParentName, strnTypeIDName);//递归     
                //删除模块id，模块关系              
                DBTAB_Module_Relation dalRelation = new DBTAB_Module_Relation(ConData.WebSiteConnectionString);
                dalRelation.DeleteByModuleID(drv["strID"].ToString());
                dal.Delete(drv["strID"].ToString());    
            }
            else
            {
                TF.WebPlatForm.Entry.Module_Information model = new TF.WebPlatForm.Entry.Module_Information();
                model.strParentID = "";
                model.strID = drv["strID"].ToString();
                if (!dal.UpdateParentID(model))
                {
                    str = str + "false";
                }
            }
        }

        return str;
    }

    /// <summary>
    /// 更新默认首页
    /// </summary>
    private void UpdateTopNav(HttpContext context)
    {
        string value = ObjectConvertClass.static_ext_string(context.Request["strTopNav"]);
        XmlClass.Update("XmlConfig.xml", "/XmlConfig/Nav/TopNav", value);
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}
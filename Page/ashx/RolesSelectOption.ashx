<%@ WebHandler Language="C#" Class="RolesSelectOption" %>


using System;
using System.Web;
using System.Data;
using TF.WebPlatForm.DBUtils;
using TF.WebPlatForm.Logic;
using TF.CommonUtility;
/// <summary>
/// 返回系统当前时间
/// </summary>
public class RolesSelectOption : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        int nfrom = ObjectConvertClass.static_ext_int(context.Request["nfrom"]);
        if (nfrom == 0)
        {
            Gethtml(context);
        }
        else if (nfrom == 1)
        {
            GetJson(context);
        }
        
    }
    /// <summary>
    /// 获取下拉框html
    /// </summary>
    protected void Gethtml(HttpContext context)
    {
        //标示是否加全部 1加 空或其它不加
        int nType = ObjectConvertClass.static_ext_int(context.Request["nType"]);

        // 获取所有角色信息
        DBUserRole userRole = new DBUserRole(ConData.WebSiteConnectionString);
        DataTable dtUnit = userRole.GetDataTable(new UserRoleQueryCondition());

        //临时存放html
        string listhtml = "";
        if (nType == 1)
        {
            listhtml = "<option value =''>全部</option>";
        }
        if (dtUnit.Rows.Count > 0)
        {
            for (int i = 0; i < dtUnit.Rows.Count; i++)
            {
                listhtml += "<option value ='" + dtUnit.Rows[i]["strID"] + "'>" + ObjectConvertClass.static_ext_string(dtUnit.Rows[i]["strName"]) + "</option>";
            }
        }
        context.Response.ContentType = "text/html";
        context.Response.Write(listhtml);
        context.Response.End(); 
    }

    /// <summary>
    /// 获取json数据
    /// </summary>
    /// <param name="context"></param>
    protected void GetJson(HttpContext context)
    {
        // 获取所有角色信息
        DBUserRole userRole = new DBUserRole(ConData.WebSiteConnectionString);
        DataTable dtRole = userRole.GetDataTable(new UserRoleQueryCondition());
        context.Response.ContentType = "application/json";
        context.Response.Write(JsonConvert.Serialize(dtRole));
        context.Response.End();
    }
    
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}
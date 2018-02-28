<%@ WebHandler Language="C#" Class="httpDat_TrainRuntime" %>
	
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
/// 获取运行记录json数据
/// </summary>
public class httpDat_TrainRuntime : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        string parameters = ObjectConvertClass.static_ext_string(context.Request["parameters"]);
        // 返回的json字符串
        string strReturnJson = "";
        if (parameters != "")
        {
            Save(context);
            //strReturnJson = Delete(parameters);
        }
        else
        {
                strReturnJson = Get(context);
        }
        context.Response.ContentType = "text/json";
        context.Response.Write(strReturnJson);
        context.Response.End();


    }

    /// <summary>
    ///  查询
    /// </summary>
    /// <param name="context"></param>
    /// <returns></returns>
    private string Get(HttpContext context)
    {
        Dat_WebLogQueryCondition Condition = new Dat_WebLogQueryCondition();
        Condition.page = ObjectConvertClass.static_ext_int(context.Request["page"]);
        Condition.rows = ObjectConvertClass.static_ext_int(context.Request["rows"]);

        Condition.dtBeginTime = ObjectConvertClass.static_ext_string(context.Request["dtBeginTime"]);
        Condition.dtEndTime = ObjectConvertClass.static_ext_string(context.Request["dtEndTime"]);

        Condition.strTrianManNumber = ObjectConvertClass.static_ext_string(context.Request["strTrianManNumber"]);
        Condition.nType = ObjectConvertClass.static_ext_int(context.Request["nType"]);
        //实例化TAB_Dat_TrainRuntime数据操作类
        DBDat_WebLog dal = new DBDat_WebLog(ConData.WebSiteConnectionString);
        DataTable dt = dal.GetDataTable(Condition);
        int nCount = dal.GetDataCount(Condition);
        return JsonConvert.SerializeP(dt, nCount);
    }

    /// <summary>
    /// 保存
    /// </summary>
    /// <param name="context"></param>
    private void Save(HttpContext context)
    {
        try
        {
            int nType = ObjectConvertClass.static_ext_int(context.Request["nType"]);
            string strPageUrl =ObjectConvertClass.static_ext_string(context.Request["strPageUrl"]);
            string strPageName = ObjectConvertClass.static_ext_string(context.Request["strPageName"]);
            PostLog.SaveLog(nType,strPageUrl,strPageName);
        }
        catch (Exception ex)
        {
            throw ex;
        } 
    }
    
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}
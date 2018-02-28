<%@ WebHandler Language="C#" Class="WebPlatForm_Dat_ErrorLog" %>

using System;
using System.Web;
using TF.CommonUtility;
using TF.WebPlatForm.Logic;
using TF.WebPlatForm.DBUtils;
using System.Data;

public class WebPlatForm_Dat_ErrorLog : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string strFun = ObjectConvertClass.static_ext_string(context.Request["strFun"]);
        if(strFun!="")
        {
            switch(strFun)
            {
                case "GetList"://查询错误信息
                    {
                        GetList(context);
                        break;
                    }
            }
        }
    }
    /// <summary>
    ///  查询错误信息
    /// </summary>
    /// <param name="context"></param>
    /// <returns></returns>
    private void GetList(HttpContext context)
    {
        DBWebPlatForm_Dat_ErrorLog dal = new DBWebPlatForm_Dat_ErrorLog(ConData.WebSiteConnectionString);
        WebPlatForm_Dat_ErrorLogQueryCondition Condition = new WebPlatForm_Dat_ErrorLogQueryCondition();
        Condition.page = ObjectConvertClass.static_ext_int(context.Request["page"]);
        Condition.rows = ObjectConvertClass.static_ext_int(context.Request["rows"]);
        Condition.strType = ObjectConvertClass.static_ext_string(context.Request["strType"]);
        Condition.strBeginTime = ObjectConvertClass.static_ext_string(context.Request["dtTimeBegin"]);
        Condition.strEndTime = ObjectConvertClass.static_ext_string(context.Request["dtEndTime"]);
        Condition.sort = "dtAddTime";
        Condition.order = "desc";
        
        DataTable dt = dal.GetDataTable(Condition);
        int nCount = dal.GetDataCount(Condition);
        
        context.Response.ContentType = "application/json";
        context.Response.Write(JsonConvert.SerializeP(dt, nCount));
        context.Response.End();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
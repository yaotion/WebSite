<%@ WebHandler Language="C#" Class="LastTwelveMonthSelectOption" %>


using System;
using System.Web;
using System.Data;
using TF.WebPlatForm.DBUtils;
using TF.WebPlatForm.Logic;
using TF.CommonUtility;
/// <summary>
/// 返回最近12个月月份的下拉框
/// </summary>
public class LastTwelveMonthSelectOption : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        //标示是否加全部 1加 空或其它不加
        int nType = ObjectConvertClass.static_ext_int(context.Request["nType"]);
        //显示几个月
        int nCount = ObjectConvertClass.static_ext_int(context.Request["nCount"]);
        if (nCount == 0)
        {
            nCount = 12; 
        }
        //临时存放html
        string listhtml = "";
        if (nType == 1)
        {
            listhtml = "<option value =''>请选择</option>";
        }
        int year= DateTime.Now.Year;
        int month = DateTime.Now.Month;
        for (int i = 1; i <= nCount; i++)
        {
            month -= 1;
            if(month==0)
            {
                month = 12;
                year -= 1; 
            }
            listhtml += "<option value ='" + year.ToString() + "-" + month.ToString() + "'>" + year.ToString() + "-" + month.ToString().PadLeft(2,'0') + "</option>";
            
        }
        context.Response.ContentType = "text/html";
        context.Response.Write(listhtml);
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
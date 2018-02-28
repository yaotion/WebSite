<%@ WebHandler Language="C#" Class="UserInfoHandle" %>

using System;
using System.Web;
using TF.CommonUtility;
using TF.WebPlatForm.Logic;
using TF.WebPlatForm.Entry;

public class UserInfoHandle : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string strType = ObjectConvertClass.static_ext_string(context.Request["strType"]);
        if (strType == "GetSystemConfig")
        {
            GetSystemConfig(context);
        }
        else if (strType == "login")
        {
            Login(context);
        }
    }

    /// <summary>
    /// 获取系统信息
    /// </summary>
    /// <param name="context"></param>
    protected void GetSystemConfig(HttpContext context)
    {
        string strSystemConfigJson = "{";
        strSystemConfigJson += "\"SiteName\":\"" + TF.WebPlatForm.Logic.ConstCommon.SiteName + "\"";
        strSystemConfigJson += ",";
        strSystemConfigJson += "\"PlatformVersion\":\"" + TF.WebPlatForm.Logic.ConstCommon.PlatformVersion + "\"";
        strSystemConfigJson += ",";
        strSystemConfigJson += "\"SiteVersion\":\"" + TF.WebPlatForm.Logic.ConstCommon.SiteVersion + "\"";
        strSystemConfigJson += "}";
        context.Response.ContentType = "application/json";
        context.Response.Write(strSystemConfigJson);
        context.Response.End();
    }

    /// <summary>
    /// 登录
    /// </summary>
    /// <param name="context"></param>
    protected void Login(HttpContext context)
    {
        System.Reflection.Assembly ass = System.Reflection.Assembly.LoadFrom(AppDomain.CurrentDomain.BaseDirectory + "bin\\" + XmlClass.Read("SysConfig.xml", "/SysConfig/login/dllName")); //加载DLL
        System.Type t = ass.GetType(XmlClass.Read("SysConfig.xml", "/SysConfig/login/ClassName"));
        IUserInfo dal = (IUserInfo)System.Activator.CreateInstance(t);
        loginReplay modelLoginReplay = dal.Login(ObjectConvertClass.static_ext_string(context.Request["loginInfo"]));
        if (modelLoginReplay.nSuccess == 1)
        {
            SetLogin(modelLoginReplay.tokenID);
        }
        context.Response.ContentType = "application/json";
        context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(modelLoginReplay));
        context.Response.End();
    }
    /// <summary> 重新设置登录
    /// </summary>
    /// <param name="ItemValue"></param>
    public void SetLogin(string itemValue)
    {
        HttpCookie cookie = new HttpCookie(UserInformation.CookieName);
        cookie.Expires = DateTime.Now.AddYears(50);
        cookie.Values.Add(UserInformation.ItemName, itemValue);
        HttpContext.Current.Response.AppendCookie(cookie);
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}
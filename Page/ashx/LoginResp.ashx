<%@ WebHandler Language="C#" Class="LoginResp" %>

using System;
using System.Web;
using TF.WebPlatForm.Logic;
using TF.WebPlatForm.Entry;

public class LoginResp : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        //简单策略
        context.Response.AddHeader("P3P", "CP=CAO PSA OUR");
        //判断是否登录
        bool IsLogin = UserInformation.IsLogin;
        string cookieString = "";
        if (IsLogin)
        {
            cookieString = string.Format("\"userID\":\"{0}\",\"userName\":\"{1}\",\"userTokeID\":\"{2}\"",
                    UserInformation.LoginUser.strTrianmanNumber, UserInformation.LoginUser.strTrianmanName, UserInformation.strTokenID);

        }
        //组合成JSONP需要的字符串
        cookieString = context.Request["callback"] + "({" + cookieString + "})";
        context.Response.Write(cookieString);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
}
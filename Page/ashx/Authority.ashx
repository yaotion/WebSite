<%@ WebHandler Language="C#" Class="Authority" %>

using System;
using System.Web;
using TF.WebPlatForm.Logic;
using TF.WebPlatForm.Entry;
using TF.CommonUtility;
using TF.WebPlatForm.DBUtils;
using TF.WebPlatForm.Entry;
using System.Reflection;
public class Authority : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        System.Reflection.Assembly ass = System.Reflection.Assembly.LoadFrom(AppDomain.CurrentDomain.BaseDirectory + "bin\\" + XmlClass.Read("SysConfig.xml", "/SysConfig/login/dllName")); //加载DLL
        System.Type t = ass.GetType(XmlClass.Read("SysConfig.xml", "/SysConfig/login/ClassName"));
        IUserInfo dal = (IUserInfo)System.Activator.CreateInstance(t);
        userInfo ui = dal.GetUserInfoByTokenID(TokeID);
        object[,] powers = RolePower.GetUserPowers(ui.strRoleID,ModuleID, PowerArray);

        context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(powers));
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

        public string TokeID
    {
        get
        {
            if (HttpContext.Current.Request["tokenID"] == null)
            {
                return "";
            }
            return HttpContext.Current.Request["tokenID"].ToString();
        }
    }
    public string ModuleID
    {
        get
        {
            if (HttpContext.Current.Request["mid"] == null)
            {
                return "";
            }
            return HttpContext.Current.Request["mid"].ToString();
        }
    }
    public object[,] PowerArray
    {
        get
        {
            if (HttpContext.Current.Request["powers"] == null)
            {
                return new string[,]{};
            }
            string[] powers = HttpContext.Current.Request["powers"].ToString().Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            
            object[,] result = new object[2,powers.Length];
            for (int i = 0; i < powers.Length; i++)
			{
			    result[0,i] = powers[i];
                result[1,i] = false;
			}
            return result;
            
        }
    }
}
<%@ WebHandler Language="C#" Class="PublicFunction" %>

using System;
using System.Web;
using TF.CommonUtility;
using System.IO;
using ICSharpCode.SharpZipLib.Zip;
using TF.WebPlatForm.DBUtils;
using TF.WebPlatForm.Entry;
using TF.WebPlatForm.Logic;

public class PublicFunction : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        string strFun = ObjectConvertClass.static_ext_string(context.Request["strFun"]);
        if (strFun != "")
        {
            switch (strFun)
            {
                case "SaveStyle": //保存样式包
                    { 
                        SaveStyle(context); 
                        break; 
                    }
                case "SaveJSLog"://保存JS错误
                    {
                        SaveJSLog(context);
                        break; 
                    }
            }
        }
    }
    /// <summary>
    /// 保存JS错误
    /// </summary>
    /// <param name="context"></param>
    private void SaveJSLog(HttpContext context)
    {
        //插入数据库
        DBWebPlatForm_Dat_ErrorLog dal = new DBWebPlatForm_Dat_ErrorLog(ConData.WebSiteConnectionString);
        WebPlatForm_Dat_ErrorLog model = new WebPlatForm_Dat_ErrorLog();
        model.strID = Guid.NewGuid().ToString("D").ToUpper();
        model.strErrorContent = ObjectConvertClass.static_ext_string(context.Request["strError"]);
        model.strType = "jsError";
        model.strClientIP = System.Web.HttpContext.Current.Request.UserHostAddress;
        model.dtAddTime = DateTime.Now;
        //登录人信息
        userInfo ui = UserInformation.LoginUser;
        model.strAddName = ui.strTrianmanName;
        model.strAddNumber = ui.strTrianmanNumber;

        dal.Add(model);
        context.Response.ContentType = "text/json";
        context.Response.Write("true");
        context.Response.End();
    }
    /// <summary>
    /// 保存样式包
    /// </summary>
    /// <param name="context"></param>
    private void SaveStyle(HttpContext context)
    {
        string strColor =  ObjectConvertClass.static_ext_string(context.Request["color"]);
        string strFileName = ObjectConvertClass.static_ext_string(context.Request["fname"]);        
        //保存压缩文件
        string file = context.Server.MapPath("/文件/样式包/上传暂存/" +DateTime.Now.ToString("yyyyMMddHHmmssff")+ strFileName);
        context.Request.Files[0].SaveAs(file);
        //解压文件
        string targetDirectory =  context.Server.MapPath("/App_Themes/Platform/themes/");
        UnZipFiles(file, targetDirectory, "");
        //删除文件
        File.Delete(file);
        //文件名
        string strName = strFileName.Substring(0, strFileName.LastIndexOf("."));        
        string strClassList = XmlClass.Read("XmlConfig.xml", "/XmlConfig/Theme/classlist");
        strClassList += " <a title='"+strName+"' class='"+strName+"'></a>";
        string strStyleList = XmlClass.Read("XmlConfig.xml", "/XmlConfig/Theme/stylelist");
        strStyleList +=  " .changetheme a." + strName + " { background: " + strColor + "; }";

        XmlClass.Update("XmlConfig.xml", "/XmlConfig/Theme/classlist", strClassList);
        XmlClass.Update("XmlConfig.xml", "/XmlConfig/Theme/stylelist", strStyleList);
     
        context.Response.ContentType = "text/json";
        context.Response.Write("true");
        context.Response.End();
    }
    /// <summary>
    /// 解压缩包（将压缩包解压到指定目录）
    /// </summary>
    /// <param name="zipedFileName">压缩包名称</param>
    /// <param name="unZipDirectory">解压缩目录</param>
    /// <param name="password">密码</param>
    public static void UnZipFiles(string zipedFileName, string unZipDirectory, string password)
    {
        using (ZipInputStream zis = new ZipInputStream(File.Open(zipedFileName, FileMode.OpenOrCreate)))
        {
            if (!string.IsNullOrEmpty(password))
            {
                zis.Password = password;//有加密文件的，可以设置密码解压
            }

            ZipEntry zipEntry;
            while ((zipEntry = zis.GetNextEntry()) != null)
            {
                string directoryName = Path.GetDirectoryName(unZipDirectory);
                string pathName = Path.GetDirectoryName(zipEntry.Name);
                string fileName = Path.GetFileName(zipEntry.Name);

                pathName = pathName.Replace(".", "$");
                directoryName += "\\" + pathName;

                if (!Directory.Exists(directoryName))
                {
                    Directory.CreateDirectory(directoryName);
                }

                if (!string.IsNullOrEmpty(fileName))
                {
                    FileStream fs = File.Create(Path.Combine(directoryName, fileName));
                    int size = 2048;
                    byte[] bytes = new byte[2048];
                    while (true)
                    {
                        size = zis.Read(bytes, 0, bytes.Length);
                        if (size > 0)
                        {
                            fs.Write(bytes, 0, size);
                        }
                        else
                        {
                            break;
                        }
                    }
                    fs.Close();
                }
            }
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
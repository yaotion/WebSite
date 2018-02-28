
<%@ page language="C#" autoeventwireup="true" inherits="UpdateBrowser, Platform" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="X-UA-Compatible" content="edge" />
<meta http-equiv="Content-Type" content="text/html;" charset=utf-8 />
<link href="/_JScripts/Platform/artdialog/skins/default.css" rel="stylesheet" />
<style type="text/css">

.w_div { background:#D8D8D8; width:100%; height:100%; position:absolute;}
.n_div { 
position: relative; 
top:50%; 
left:50%; 
margin:-75px 0 0 -310px; 
width:620px; 
height:200px; 

} 
</style>

      <%if (!(TF.CommonUtility.ObjectConvertClass.static_ext_double(TF.CommonUtility.UriClass.getBrowserVersion()) < 8 && (TF.CommonUtility.UriClass.getBrowserName() == "InternetExplorer" || TF.CommonUtility.UriClass.getBrowserName() == "IE")))
        {%>
           <script type="text/javascript">  window.location.href = "/login.html"; </script>
        <%}%>
</head>

<body  >
<form id="login" runat="server">
<div class="w_div">
<div class="n_div">
<div>
<div style=" float:left;"><img src="/_Images/Platform/frame/default/BrowserVersionWaring.png"/></div>
<div style=" float:left; font-family:微软雅黑; font-size:large; line-height:40px; padding-top:17px;">
抱歉,您的浏览器版本过低,将无法正常使用本站,</br>建议您升级到
<a style=" font-size:larger; color:#002E73;" href="http://www.microsoft.com/china/windows/internet-explorer/" mce_href="http://www.microsoft.com/china/windows/internet-explorer/" target="_blank"> Internet Explorer 8</a>及以上或以下浏览器:</div>
</div>
<div style=" clear:both; line-height:35px; font-family:微软雅黑; font-size:large; padding-top:17px; text-align:right">
<a style="color:#002E73; text-decoration:underline" href="http://www.mozillaonline.com/" mce_href="http://www.mozillaonline.com/" target="_blank">火狐</a>
 / <a style="color:#002E73; text-decoration:underline" href="http://www.google.com/chrome/?hl=zh-CN" mce_href="http://www.google.com/chrome/?hl=zh-CN" target="_blank">Chrome</a> 
 / <a style="color:#002E73; text-decoration:underline" href="http://www.maxthon.cn/" mce_href="http://www.maxthon.cn/" target="_blank">遨游</a> / 
 <a style="color:#002E73; text-decoration:underline" href="http://se.360.cn/" mce_href="http://se.360.cn/" target="_blank">360</a> / 
 <a style="color:#002E73; text-decoration:underline" href="http://ie.sogou.com/" mce_href="http://ie.sogou.com/" target="_blank">搜狗</a></div>

</div>
</div>
</form>
</body>
</html>


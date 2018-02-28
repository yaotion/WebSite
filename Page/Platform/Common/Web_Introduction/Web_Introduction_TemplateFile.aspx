<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="Page_Platform_Common_Web_Introduction_Web_Introduction_TemplateFile, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="/_JScripts/Platform/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
        //初始化
        $(function () {
            setHeight();
        });
        //页面自适应
        $(window).resize(function () {
            setHeight();
        });
        //设置高度
        function setHeight() {
            $('#divLayout').height($(window).height()-22);
        }
    </script>
     <style type="text/css">
        .cblue {
            margin-top:20px;
            color: blue;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="divLayout" style="padding:20px 20px 0px 40px;overflow:auto;border:1px solid #DDDDDD;margin-bottom:20px;">
        <ul style="font-size:15px;">
            <li><h2 class="cblue">/Main.aspx</h2>
                <div style="margin-top:20px;">
                    功能：网站主框架模板,头部导航信息（一级导航）、网站标题、logo、登录信息、页面内容在此显示。<br />
                    使用说明：
                    <ol style="margin-left:40px;">
                        <li>如果需要左侧导航，则在模块管理中添加头部导航时的Url地址写入：/LeftMain.aspx?parentid=4&leftid=8，其中parentid为本身的id，leftid为默认的左侧导航页面id。</li>
                        <li>如果不需要左侧导航，则在模块管理中添加头部导航时的Url地址写入需打开的页面地址即可，例如：/Page/Platform/Dic_StaffInfo/Dic_StaffInfo_List.aspx。</li>
                    </ol>
                    <img alt="" src="Image/Main.jpg" />
                </div>
            </li>
            <li><h2 class="cblue">/LeftMain.aspx</h2>
                  <div style="margin-top:20px;">
                    功能：网站左侧导航（二级导航）信息及对应内容模板。<br />
                    使用说明：如无需头部导航，可直接将页面地址赋值给网站，则只显示左侧导航和对应内容。
                </div>
                <img src="Image/LeftMain.jpg" alt="" />
            </li>
        </ul>
    </div>
</asp:Content>

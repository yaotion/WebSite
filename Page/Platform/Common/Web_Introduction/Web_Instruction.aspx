<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="Page_Platform_Common_Web_Introduction_Web_Instruction, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        var nCutheight = 70;
        //初始化
        jQuery(function () {
            $('#MainFrame').height($(window).height() - nCutheight);
            document.getElementById("ajs").click();
        })
        //页面自适应
        $(window).resize(function () {
            $('#MainFrame').height($(window).height() - nCutheight);
        });

        //导航选中色
        function TopNavClick(parentid, name) {           
            BindTopNavColor(parentid, name);
        }

        //绑定头部导航选中色
        function BindTopNavColor(id, name) {
            if (name != undefined && name != '') {
                $("[name=" + name + "]").removeClass("current");
            }
            $("#" + id).parent().addClass("current");
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="header">
            <ul id="menu" class="headermenu">
                <li>
                    <h2 style="padding: 0 10px 0 10px; color: white;height:55px;line-height:55px;">WEB模板API</h2>
                </li>
                <li name="TopNav"><a style="height:44px;line-height:44px;"  id="ajs" href="Web_Introduction_JS.aspx" target="MainFrame" onclick="TopNavClick('ajs','TopNav')">JS文件</a></li>
                <li name="TopNav"><a style="height:44px;line-height:44px;" id="acss" href="Web_Introduction_CSS.aspx" target="MainFrame" onclick="TopNavClick('acss','TopNav')">CSS文件</a></li>
                <li name="TopNav"><a style="height:44px;line-height:44px;" id="amodel" href="Web_Introduction_TemplateFile.aspx" target="MainFrame" onclick="TopNavClick('amodel','TopNav')">模板文件</a></li>
            </ul>
        </div>
        <div id="allbody" style="width: 100%; min-height: 200px; height: auto;">
            <iframe id="MainFrame" name="MainFrame" src="" width="100%" style="min-height: 200px; "
                frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no"
                allowtransparency="yes"></iframe>
        </div>
    </div>
</asp:Content>

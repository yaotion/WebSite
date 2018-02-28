<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="Main, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .changetheme a.temp {
            background: #2079b3;
        }
    </style>
    <%="<style type='text/css'>"+TF.CommonUtility.XmlClass.Read("XmlConfig.xml", "/XmlConfig/Theme/stylelist")+"</style>" %>
    <script type="text/javascript">
        var nCutheight = 86;

        jQuery(function () {

            $('#MainFrame').height($(window).height() - nCutheight);
            BindTopNav();
        })

        $(window).resize(function () {
            $('#MainFrame').height($(window).height() - nCutheight);
        });
        //绑定头部导航
        function BindTopNav() {
            AjaxGet("/_Masters/ashx/MasterTabDiv.ashx?nType=1&strParentID=1", "html", function (data) {
                $("#menu").html(data);
                GetNavDefaultValue();
            });
        }

        function TopNavClick(parentid, name) {
            //导航选中色
            BindTopNavColor(parentid, name);
        }



        //获取配置文件中默认导航
        function GetNavDefaultValue() {
            AjaxGet("/XmlConfig.xml", "xml", function (xml) {
                var id = $(xml).find("TopNav").text();
                BindTopNavColor(id, "TopNav");
                if ($("#" + id).attr("target") == "MainFrame") {
                    $("#MainFrame").attr("src", $("#" + id).attr("href"));
                }
            });
        }
        //绑定头部导航选中色
        function BindTopNavColor(id, name) {
            if (name != undefined && name != '') {
                $("[name=" + name + "]").removeClass("current");
            }
            $("#" + id).parent().addClass("current");
        }

        //注册事件 当右下角弹窗关闭时触发
        function rightDownClose() {
            $("#Warnbgsound").attr("src", "");
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="topheader">

            <div class="left">
                <span style="float: left; width: 78px; text-align: center; display: block;">
                    <img alt="logo" src="<%=(TF.CommonUtility.XmlClass.Read("XmlConfig.xml","/XmlConfig/logo/logo")=="0"?"/_Images/Platform/LogoImg":"/文件/LogoImg")%>/logo.png?v=<%=TF.CommonUtility.XmlClass.Read("SysConfig.xml", "/SysConfig/logoImg/version") %>" /></span>
                <h1 class="logo">
                    <%=TF.WebPlatForm.Logic.ConstCommon.SiteName%></h1>
                <a href="#" onclick="artDialogOpen('/Page/Platform/Module_Information/SiteMap.aspx','系统地图',445,540)"><span class="slogan">[系统地图]</span></a>
                <br clear="all" />
            </div>
            <!--left-->
            <div class="right">
                <!--<div class="notification">
                <a class="count" href="ajax/notifications.html"><span>9</span></a>
        	</div>-->
                <div class="userinfo">
                    <img src="<%=(TF.CommonUtility.XmlClass.Read("XmlConfig.xml","/XmlConfig/logo/avatar")=="0"?"/_Images/Platform/LogoImg":"/文件/LogoImg")%>/avatar.png?v=<%=TF.CommonUtility.XmlClass.Read("SysConfig.xml", "/SysConfig/logoImg/version") %>" alt="" />
                    <span>
                        <%=strUser %></span>
                </div>
                <!--userinfo-->
                <div class="userinfodrop">
                    <div class="avatar">
                        <a href="">
                            <img src="<%=(TF.CommonUtility.XmlClass.Read("XmlConfig.xml","/XmlConfig/logo/avatarBig")=="0"?"/_Images/Platform/LogoImg":"/文件/LogoImg")%>/avatarBig.png?v=<%=TF.CommonUtility.XmlClass.Read("SysConfig.xml", "/SysConfig/logoImg/version") %>" alt="" /></a>
                        <div class="changetheme">
                            切换主题:
                            <br />
                            <div id="divtheme">
                                <%=TF.CommonUtility.XmlClass.Read("XmlConfig.xml", "/XmlConfig/Theme/classlist") %>
                                <%--<a class="default"></a><a class="blueline"></a><a class="greenline"></a><a class="contrast"></a><a class="bluebg"></a><a class="temp"></a>   --%>
                            </div>
                        </div>
                    </div>
                    <!--avatar-->
                    <div class="userdata" style="min-height: 150px;">
                        <h4>
                            <%=strUser %></h4>
                        <span class="email"></span>
                        <ul>
                            <%--<li><a href="#" onclick="SaveLog(1,'/Page/Platform/NavConfig/NavIconConfig.aspx','导航图标');artDialogOpen('/Page/Platform/NavConfig/NavIconConfig.aspx', '导航图标')">
                                导航图标</a></li>--%>
                            <li><a href="#" onclick="SaveLog(1,'/Page/Platform/UserInfo/PassWordReset.aspx','设置密码');artDialogOpen('/Page/Platform/UserInfo/PassWordReset.aspx?strTrainNumber=<%=strNumber%>', '设置密码', 370, 219)">设置密码</a></li>
                            <li><a href="/Loginout.aspx">退出</a></li>
                        </ul>
                    </div>
                    <!--userdata-->
                </div>
                <!--userinfodrop-->
            </div>
            <!--right-->
        </div>
        <!--topheader-->
        <div class="header">
            <ul id="menu" class="headermenu">
            </ul>
        </div>
        <!--header-->
        <div id="allbody" style="width: 100%; min-height: 200px; height: auto;">
            <iframe id="MainFrame" name="MainFrame" src="" width="100%" style="min-height: 200px; height: auto;"
                frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no"
                allowtransparency="yes"></iframe>
        </div>
    </div>
</asp:Content>

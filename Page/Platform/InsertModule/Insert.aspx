<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="_Insert, Platform" title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="/_JScripts/Platform/frame/jquery.uniform.min.js"></script>
    <script type="text/javascript">
        //页面resize事件
        $(window).resize(function () {
            setMargin();
        });
        function setMargin()
        {
            $("#bodyContent").height($(window).height());
            $("#bodyContent").css("line-height", $(window).height().toString() + "px");
        }
        $(function () {
            $("#bodyContent").height($(window).height());
            $("#bodyContent").css("line-height", $(window).height().toString()+"px");
            jQuery('input:checkbox, input:radio, select.uniformselect, input:file').uniform();
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="bodyContent" style="width:100%;">
        <div id="content" style="width:700px;height:40px; margin:auto;">
            DLL名称:<input id="ddlName" runat="server" type="text" style="width:200px; height:12px;"/>
            属性类名称:<input id="moduleInfoName" runat="server" type="text" style="width:200px; height:12px;"/>
            <asp:Button ID="LoadModuleInfo" class="btn" runat="server" Text="加载模块" style="width:70px;height:30px;" OnClick="LoadModuleInfo_Click"/>

        </div>
    </div>
</asp:Content>


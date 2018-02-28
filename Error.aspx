<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="Error, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(function () {
            SetHeightWidth();
        })
        //页面resize事件
        $(window).resize(function () {
            SetHeightWidth();
        });
        //重设datagrid宽高
        function SetHeightWidth() {
            $("#divError").height($(window).height() * 0.5);
            $("#divContent").height($(window).height() * 0.5);
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 0 auto;font-family:'微软雅黑';">
        <div id="divContent" style="width: 90%; background-color: #f1f1f1;text-align:center;position:absolute;left:5%;margin:0 auto;bottom:0;">
            <span id="sp" style="text-align: center;display:block; font-size: 90px; color: #ea0f0f;line-height:90px;position:absolute;bottom:100%;width:100%;">404</span>
        </div>

        <div  id="divError" style="background: rgba(32,46,62,0.6); width: 100%;  bottom: 0; margin: 0 auto; position: absolute;">
            <div style="margin: 0 auto; text-align: center;font-size: 30px;line-height:60px; color: #ffffff;">
                <p><span style="font-size: 30px;line-height:60px;">抱歉,系统出问题了！！！</span></p>
            </div>
        </div>

    </div>
</asp:Content>

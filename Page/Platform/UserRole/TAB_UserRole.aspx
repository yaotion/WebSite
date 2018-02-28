<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="TAB_UserRole_TAB_UserRole, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">

        $(function () {
            CheckQuery();
        })

        function beforeclick() {
            if ($("#<%=FUInPut.ClientID%>").val() == "") {
        alert("请选择导入文件");
        return false;
    }
    return true;
}
function Export() {
    AjaxGet("TAB_UserRole.aspx?nType=1", "html", function (data) {
        $("#aExport").attr("href", "/Page/Platform/FileDownLoad.aspx?strPath=" + encodeURI(data));
        $("#clickSpan").click();
    });
}
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="SerachDiv" style="margin: 10px; border: 1px #DDDDDD solid; background-color: #FBFBFB; width: 98%;">
        <div style="margin-left: 10px; height: 55px; line-height: 55px; vertical-align: middle; border-radius: 5px;">

            <a href="#" onclick="Add()" class="btn btn_orange btn_add" style="margin-top: 10px; margin-left: 10px;"><span>添加</span></a>
            <span class="UserRoleHide" style="float: right; margin-top: 10px;">
                <asp:Button ID="btInPut" runat="server" Text="数据导入" OnClientClick="return beforeclick()" OnClick="btInPut_Click" /></span>
            <span class="UserRoleHide" style="float: right; margin-top: 10px;">
                <asp:FileUpload ID="FUInPut" Height="30" Style="margin-left: 10px;" runat="server" /></span>
            <span class="UserRoleHide" style="float: right; margin-top: 10px;">
                <a href="#" onclick="Export()" class="btn btn_orange btn_export " style="margin-left: 10px; width: 100px;"><span>数据导出</span></a>
                <a id="aExport" href="#" target="_blank"><span id="clickSpan"></span></a></span>          
        </div>
    </div>
    <div class="ml10 mt10">
        <div id="list">
        </div>
    </div>

    <script type="text/javascript">
        var width = $("#SerachDiv").width() + 2;
        var height = $(window).height() - $("#SerachDiv").height() - 30;
        $('#list').datagrid({
            striped: true,
            nowrap: true,
            pagination: true,
            rownumbers: true,
            method: 'post',
            singleSelect: true,
            fitColumns: true,
            height: height,
            width: width,
            pageSize: 15,
            pageList: [10, 15, 20],
            loadMsg: '数据加载中,请稍候..',
            columns: [[
                        { field: 'strName', title: '角色名称', width: 476, align: 'center' },
                        {
                           field: 'strID', title: '操作', width: 303, align: 'center', formatter: function (val, row) {
                               if (row.nHidden == 1 && "<%=strRoleID%>" != "1") {
                               return "<font size='1px' color='gray'>(注:不可修改)</font>";
                           }
                           else if (row.nHidden == 1 && "<%=strRoleID%>" == "1") {
                               return "<a href='#'onclick=\"Edit('" + row.strID + "')\">[编辑]</a>";

                           }
                           else {
                               return "<a href='#'onclick=\"Edit('" + row.strID + "')\">[编辑]</a>&nbsp;&nbsp;&nbsp;<a href='#' style='color:red' onclick=\"Del('" + row.strID + "')\">[删除]</a>";
                           }
                       }
                   }
            ]]
        });

           //查询操作
           function CheckQuery() {
               var Options = {};
               Options.url = encodeURI('ashx/WebPlatForm_UserRole.ashx?RandomID=' + Math.random());
               Options.queryParams = {
                   strFun: 'Get',
                   strName: $("#TB_strName").val()
               };
               $('#list').datagrid(Options);
               //记录日志
               // SaveLog(5, window.location.pathname, "角色管理");
           }

           //添加
           function Add() {
               artDialogOpen('/Page/Platform/UserRole/TAB_UserRoleEdit.aspx', '添加', 600, 450);
           }

           //编辑
           function Edit(ID) {
               artDialogOpen('/Page/Platform/UserRole/TAB_UserRoleEdit.aspx?EditId=' + ID, '编辑', 600, 450);
           }

           //删除
           function Del(ID) {
               art.dialog({
                   content: '确定要删除该项吗?',
                   ok: function () {                       
                       AjaxGet('/Page/Platform/UserRole/ashx/WebPlatForm_UserRole.ashx?strFun=delete&parameters=' + ID, "html", function (data) {
                           if (data == "true") {
                               publicShowResult(data);
                           }
                           else if (data == "false") {
                               art.dialog.tips('删除失败', 1);
                           }
                       });
                   },
                   cancelVal: '关闭',
                   cancel: true //为true等价于function(){}
               });

               //记录日志
               // SaveLog(3, window.location.pathname, "角色管理");
           }
           //权限
           //function Authority(RowID) {
           //    artDialogOpen('/Page/Platform/UserRole/TAB_RolePermissions.aspx?RoleID=' + RowID, '编辑');
           //}
           //页面刷新
           function appdel_do() {
               publicShowResult("true");
           }
    </script>

</asp:Content>

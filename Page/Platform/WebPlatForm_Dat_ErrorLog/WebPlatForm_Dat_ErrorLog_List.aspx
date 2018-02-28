<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="Page_Platform_WebPlatForm_Dat_ErrorLog_WebPlatForm_Dat_ErrorLog_List, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <script type="text/javascript" charset="gb2312" src="/_JScripts/Platform/frame/jquery.uniform.min.js"></script>
    <script type="text/javascript" src="/_JScripts/Platform/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
        $(function () {
            jQuery('input:checkbox, input:radio, select.uniformselect, input:file').uniform();
            CheckQuery();
        });

        function Export()
        {
            $("#<%=btnExport.ClientID%>").click();
        }
    </script>
    <style type="text/css">
          .selector span
        {
            min-width: 62px;
        }
        .datagrid-header .datagrid-cell
        {
            height: 40px;
            line-height: 40px;
            vertical-align: middle;
            background-color: #f7f7f7;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="SerachDiv" style="margin: 10px; border: 1px #DDDDDD solid; background-color: #FBFBFB; width: 98%;">
        <div style="margin-left: 10px; height: 55px; line-height: 55px; vertical-align: middle; border-radius: 5px;">
           时间：<input id="taBeginTime" name="taBeginTime" type="text" style="width:120px;" onfocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'});" />~<input id="taEndTime" name="taEndTime" type="text" style="width:120px;" onfocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'});" />
           类型： <select id="ddlType" name="ddlType" class="uniformselect">
                <option value="">全部</option>
                <option value="jsError">jsError</option>
                <option value="serverError">serverError</option>
            </select>
            <a href="#" class="btn btn_orange btn_search" onclick="CheckQuery()"><span>查询</span></a>
            <a href="#" onclick="Export()" class="btn btn_orange btn_export " style="margin-left: 10px; width: 100px;"><span>数据导出</span></a>
            <asp:Button ID="btnExport" OnClick="btnExport_Click" runat="server" Text="" style="height:0px;width:0px;  visibility:hidden;"/>
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
                { field: 'dtAddTime', title: '时间', width: 140,fixed:true, align: 'center' },
                { field: 'strType', title: '类型', width: 80, align: 'center' },
                {
                    field: 'strErrorContent', title: '报错内容', width: 200, align: 'left', halign: 'center', formatter: function (val, row) {
                        if (val != undefined) {
                            val = val.replace(/"/g, "”");
                            val = val.replace(/\s+/g, " ");
                            val = val.replace(/'/g, "”");
                        }
                        return "<a href='#' title=\"" + val + "\" onclick=\"art.dialog({content: '<textarea style=\\' margin:-22px -25px -21px -25px; width:600px;height:330px\\'>" +val + "</textarea>',width:600,height:330})\">"+val+"</a>";
                    }
                },
                { field: 'strAddNumber', title: '登录人', width: 80, align: 'center' },
                { field: 'strClientIP', title: '客户端IP', width: 100, align: 'center' }
            ]]
        });

        //查询操作
        function CheckQuery() {
            var Options = {};
            Options.url = encodeURI('ashx/WebPlatForm_Dat_ErrorLog.ashx?strFun=GetList&RandomID=' + Math.random());
            Options.queryParams = {
                dtTimeBegin: $("#taBeginTime").val(),
                dtEndTime: $("#taEndTime").val() != "" ? $("#taEndTime").val() +" 23:59:59": "",
                strType:$("#ddlType").val()
            };
            $('#list').datagrid(Options);
        }
    </script>

</asp:Content>

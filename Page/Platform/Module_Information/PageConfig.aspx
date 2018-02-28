<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="Page_Platform_Module_Information_PageConfig, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        //页面resize事件
        $(window).resize(function () {
            return;
        });

        //初始化
        $(function () {
            CheckQuery();
        });
        //保存前验证
        function beforeSave() {
            var selRows = $('#ModuleList').datagrid('getChecked');
            var bConfig = true;
            var strNavName = "";
            var count = 0;
            if (selRows.hasOwnProperty("length")) {
                for (var i = 0; i < selRows.length; i++) {
                    if (selRows[i].strURL == "") {
                        if (count > 0) {
                            strNavName += ",";
                        }
                        bConfig = false;
                        strNavName += selRows[i].strUrlDescription;
                        count++;
                    }
                }
                if (!bConfig) {
                    alert("导航'" + strNavName + "'缺少URL数据,请设置后重试保存");
                    return false;
                }
            }

            $("#<%=HFSelRows.ClientID%>").val(JSON.stringify(selRows));
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="HFModule" runat="server" />
    <asp:HiddenField ID="HFModuleID" runat="server" />
    <asp:HiddenField ID="HFSelRows" runat="server" />
    <div style="width: 770px; height: 20px; color: gray; margin-left: 7px;">
        *&nbsp;显示分类所辖下属页面及未分配分类的页面
    </div>
    <div align="left" style="width: 767px; height: 400px;">
        <div style="margin: 2px 5px 0 5px;">
            <div id="ModuleList"></div>
        </div>
    </div>
    <table style="width: 767px; height: 30px; margin-top: 5px;">
        <tr>
            <th>
                <asp:Button ID="btnSave" runat="server" Text="保存" OnClientClick="return beforeSave();"
                    Style="padding: 0; width: 60px; height: 30px;" OnClick="btnSave_Click" />
                &nbsp;&nbsp;
            <input type="button" id="btnCancel" value="取消" title="取消" style="width: 60px; height: 30px; margin-left: 5px;"
                onclick="art.dialog.close();" />
            </th>
        </tr>
    </table>

    <script type="text/javascript">
        //课程计划
        $('#ModuleList').datagrid({
            striped: true,
            width: 767,
            height: 400,
            singleSelect: false,
            checkOnSelect: true,
            selectOnCheck: true,
            loadMsg: '准备数据...',
            fitColumns: true,
            rownumbers: true,
            autoRowHeight: true,
            pagination: false,
            nowrap: false,
            method: 'post',
            pageSize: 15,
            pageList: [10, 15, 20],
            onLoadSuccess: function (data) {
                var rowData = data.rows;
                $.each(rowData, function (index, val) {//遍历JSON     
                    if (val.strParentID != "") { //如果数据行为已选中则选中改行   
                        $("#ModuleList").datagrid("selectRow", index);
                    }

                });
            },
            columns: [[
                { field: 'ck', checkbox: true },
                {
                    field: 'strUrlDescription', title: '模块名称', fixed: true, width: 150, align: 'center', formatter: function (val, row) {
                        return "<span title='" + val + "'>" + val + "</span>";
                    }
                },
                {
                    field: 'strID', title: 'strID', width: 130, align: 'left', halign: 'center', formatter: function (val, row) {
                        return "<span title='" + val + "'>" + val + "</span>";
                    }
                },
                {
                    field: 'strURL', title: 'Url地址', width: 150, align: 'left', halign: 'center', formatter: function (val, row) {
                        return "<span title='" + val + "'>" + val + "</span>";
                    }
                },
                {
                    field: 'nsortid', title: '操作', width: 60, align: 'center', halign: 'center', formatter: function (val, row) {
                        return "<a href='#'  onclick=\"Edit('" + row.strID + "')\" ><img title='修改' src='/_Images/Platform/NormalIcon/Edit11.png'/></a>";
                    }
                }
            ]]
        });

        //查询
        function CheckQuery() {
            var Options = {};
            Options.url = "ashx/Module_Information.ashx?strFun=GetPageConfig";
            Options.queryParams = {
                strModuleID: $("#<%=HFModuleID.ClientID%>").val()
            };
        $('#ModuleList').datagrid(Options);
    }
    //编辑
    function Edit(ID) {
        artDialogOpen('/Page/Platform/Module_Information/Module_InformationEdit.aspx?EditId=' + ID, '编辑')
    }
    //页面刷新
    function appdel_do() {
        $("#ModuleList").datagrid('reload');
        art.dialog.tips('操作成功', 1);
    }
    //页面刷新并提示自定义信息
    function appdel_do_custom(message) {
        publicShowResult_custom(message);
    }
    </script>
</asp:Content>

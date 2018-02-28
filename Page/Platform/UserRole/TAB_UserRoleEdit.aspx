<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="TAB_UserRole_TAB_UserRoleEdit, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="/_JScripts/Platform/frame/jquery.uniform.min.js"></script>
    <script type="text/javascript">
        $(function () {
            BindRoleSelect();
            jQuery('input:checkbox, input:radio, select.uniformselect, input:file').uniform();
            CheckQuery();
            setTimeout("$('#<%=TB_strName.ClientID%>').focus();",500);
            
            
        })
        function beforeSave() {
            if (isNullMessage("<%=TB_strName.ClientID%>", "请输入名称", "提醒") == false) {
                return false;
            }
            //判断
            var selRows = $("#list").treegrid('getCheckedNodes');
            $("#<%=HFSelRows.ClientID%>").val(JSON.stringify(selRows));

            return true;
        }
        //绑定角色信息
        function BindRoleSelect() {
            $('#ddRole').combobox({
                url: '/Page/ashx/RolesSelectOption.ashx?nfrom=1&r=' + Math.random(),
                method: 'get',
                valueField: 'strID',
                textField: 'strName',
                multiple: true,
                onChange: function (newValue, oldValue) {
                    GetRolePower();
                }
            });
        }
        //页面resize事件
        $(window).resize(function () {
            SetHeightWidth();
        });
        //重设datagrid宽高
        function SetHeightWidth() {
            if ($('#list') != undefined && $('#list') != null) {
                if ($('#list').length > 0) {
                    $('#list').datagrid('resize', {
                        width: 598,
                        height: 379
                    });
                }
            }
        }
        //获取角色权限
        function GetRolePower()
        {
            var selRoles = $("#ddRole").combobox("getValues");
            if (selRoles != '')
            {
                AjaxPost("ashx/WebPlatForm_UserRole.ashx?strFun=GetRolePower", { selRoles: selRoles.toString() }, function (data) {
                    if(data.length>0)
                    {
                        var listdata = $("#list").treegrid("getData");

                        for (var i = 0; i < data.length; i++)
                        {
                            for(var j=0;j<listdata.length;j++)
                            {
                                if(data[i].strModuleID==listdata[j].strModuleID&&data[i].strPowerID==listdata[j].strPowerID)
                                {
                                    $("#list").treegrid("checkNode", listdata[j].id); break;
                                }
                                else
                                {
                                    var listdatachildren=listdata[j].children;
                                    if (listdatachildren!=undefined&&listdatachildren.length > 0)
                                    {
                                        for(var z=0;z<listdatachildren.length;z++)
                                        {
                                            if (data[i].strModuleID == listdatachildren[z].strModuleID && data[i].strPowerID == listdatachildren[z].strPowerID) {
                                                $("#list").treegrid("checkNode", listdatachildren[z].id); break;
                                            }
                                        }
                                    }
                                }
                            }
                        }

                    }
                });
            }
            else
            {
                $.messager.alert("提示","请选择需要继承的角色！")
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="HFRoleID" runat="server" />
    <asp:HiddenField ID="HFOldSelRows" runat="server" />
    <asp:HiddenField ID="HFSelRows" runat="server" />
    <div id="toolbar" style="height:50px;line-height:50px; vertical-align:middle; padding-left:10px;">
        角色名称:
        <input id='TB_strName' runat="server" style='width: 150px; height: 13px;' type='text' value='' />       
        继承角色（ * 可多选）:
        <select id="ddRole" style="width: 190px; height: 30px;"></select> 
        <%--<input id="btnAction" type="button" style="height:29px;" onclick="" value="执行" />--%>
    </div>
    <div>
        <div id="list">
        </div>
    </div>

    <div>
        <div style="padding: 20px; clear: both;">

            <div style="clear: both; height: 30px; width: 343px;">
                <input type="button" id="btn_fb" value="取消" title="取消" style="width: 60px; height: 30px; margin-left: 5px; float: right;"
                    onclick="art.dialog.close();" />

                <asp:Button ID="BtnSave" runat="server" Text="保存" OnClientClick="return beforeSave();"
                    OnClick="BtnSave_Click" Style="width: 60px; height: 30px; float: right; margin-right: 10px;" />

            </div>
        </div>
    </div>
    <script type="text/javascript">

        $('#list').treegrid({
            toolbar: "#toolbar",
            idField: 'id',
            treeField: 'text',
            width: 598,
            height: 379,
            fitColumns: true,
            animate: true,
            checkbox: true,
            cascadeCheck: true,
            lines: true,
            loadMsg: '数据加载中,请稍候..',
            onLoadSuccess: function (row, data) {
                var ck = $("#list").treegrid('getCheckedNodes');
                $("#<%=HFOldSelRows.ClientID%>").val(JSON.stringify(ck));
            },
            columns: [[
                { field: 'text', title: '名称', width: 300, align: 'left', halign: 'center' },
                {
                    field: 'id', title: '权限ID', width: 200, align: 'left', halign: 'center', formatter: function (val, row) {
                        if (row.nLevel == "2") { return row.strPowerID; }
                        return "";
                    }
                }
            ]]
        });

        //查询操作
        function CheckQuery() {
            var Options = {};
            Options.url = encodeURI('ashx/WebPlatForm_UserRole.ashx?strFun=GetTreeList&RandomID=' + Math.random());
            Options.queryParams = {
                strRoleID: $("#<%=HFRoleID.ClientID%>").val()
            };
        $('#list').treegrid(Options);
    }
    //页面刷新
    function appdel_do() {
        publicShowResult("true");
    }
    </script>
</asp:Content>

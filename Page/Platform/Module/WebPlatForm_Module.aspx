<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="Module_WebPlatForm_Module, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">

        $(function () {
            CheckQuery();
            BindOnBeforeRefresh();
            BindOnSelectPage();
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%if (TF_MoKuaiGuanLi_Add == true)
      { %>
    <div id="SerachDiv" style="margin: 10px; border: 1px #DDDDDD solid; background-color: #FBFBFB; width: 98%;">
        <div style="margin-left: 10px; height: 55px; line-height: 55px; vertical-align: middle; border-radius: 5px;">
            <a href="#" onclick="Add()" class="btn btn_orange btn_add" style="width: 100px; margin-top: 10px; margin-left: 10px;"><span>添加模块</span></a>
        </div>
    </div>
    <%} %>

    <div style="margin-left: 10px;">
        <div id="list">
        </div>
    </div>

    <script type="text/javascript">
        var width = $("#SerachDiv").width() == null ? ($(window).width() - 20) : ($("#SerachDiv").width() + 2);
        var height = $(window).height() - ($("#SerachDiv").height() == null ? 0 : $("#SerachDiv").height()) - 30;
        $('#list').treegrid({
            idField: 'strID',
            treeField: 'strName',
            lines: true,
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
            onBeforeExpand: function (row) {
                $(this).treegrid('options').url = 'WebPlatForm_Module.aspx?strFun=GetModulePower&strModuleID=' + row.strID + '&mathid=' + Math.random();
            },
            rowStyler: function (row) {
                if (row.nEnable > 0) {
                    return 'background-color:#DDDDDD;color:#fff;';
                }
            },
            columns: [[

                        { field: 'strName', title: '模块名称', width: 400, align: 'left' },
                        { field: 'strID', title: '模块ID', width: 250, align: 'left' },
                        {
                            field: 'nEnable', title: 'web属性', width: 100, align: 'left', formatter: function (val, row) {
                                if (row.nLevel == 1) {
                                    return "";
                                }
                                else {
                                    if (parseInt(row.webInfoCount) > 0) {
                                        return "<div style='float:left;height:16px; padding-top:4px;'><img title='拥有Web属性' src='/_Images/Platform/NormalIcon/Right16.png'/></div>" + "<div style='float:left;height:23px;line-height:23px; vertical-align:middle'>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' title='编辑WEB属性' onclick=\"EditWebInfo('" + row.strID + "')\">[编辑]</a></div>";
                                    }
                                    else {
                                        return "<div style='float:left;height:16px;padding-top:4px;'><img title='没有Web属性' src='/_Images/Platform/NormalIcon/Wrong16.png'/></div>" + "<div style='float:left;height:23px;line-height:23px; vertical-align:middle'>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' title='添加WEB属性' onclick=\"AddWebInfo('" + row.strID + "')\">[添加]</a></div>";
                                    }
                                }
                            }
                        },
                        {
                            field: 'nID', title: '操作', width: 180, align: 'center', formatter: function (val, row) {
                                var rtnHtml = "";

                                if (row.nLevel == 1) {
                                    <%if (TF_MoKuaiQuanXian_Add)
                                      {%>
                                    rtnHtml += "<a href='#' title='添加功能' onclick=\"PowerAdd('" + row.strID + "')\"><img style='padding-top:5px;' src='/_Images/Platform/NormalIcon/Add16.png'/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                                    <%}%>
                                    <%if (TF_MoKuaiGuanLi_Edit)
                                      {%>
                                    rtnHtml += "<a href='#' title='编辑' onclick=\"Edit('" + row.strID + "')\"><img style='padding-top:5px;' src='/_Images/Platform/NormalIcon/Edit16.png'/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                                    <%}%>
                                    <%if (TF_MoKuaiGuanLi_Disable)
                                      {%>
                                    if (row.nEnable > 0) {
                                        rtnHtml += "<a href='#' title='启用模块' style='color:blue' onclick=\"RemoveDisable('" + row.strID + "')\"><img style='padding-top:5px;' src='/_Images/Platform/NormalIcon/lockopen16.png'/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                                    }
                                    else {
                                        rtnHtml += "<a href='#' title='禁用模块' style='color:blue' onclick=\"Disable('" + row.strID + "')\"><img style='padding-top:5px;' src='/_Images/Platform/NormalIcon/lock16.png'/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                                    }

                                    <%}%>
                                    <%if (TF_MoKuaiGuanLi_Delete)
                                      {%>
                                    rtnHtml += "<a href='#' title='删除' style='color:red' onclick=\"Del('" + row.strID + "')\"><img style='padding-top:5px;' src='/_Images/Platform/NormalIcon/DelA16.png'/></a>";
                                    <%}%>
                                }
                                else if (row.nLevel == 2) {
                                    <%if (TF_MoKuaiQuanXian_Edit)
                                      {%>
                                    rtnHtml += "<a href='#' title='编辑' onclick=\"PowerEdit('" + row.strPowerGUID + "')\"><img style='padding-top:5px;' src='/_Images/Platform/NormalIcon/Edit16.png'/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                                    <%}%>
                                    <%if (TF_MoKuaiQuanXian_Delete)
                                      {%>
                                    rtnHtml += "<a href='#' title='删除' style='color:red' onclick=\"PowerDel('" + row.strID + "')\"><img style='padding-top:5px;' src='/_Images/Platform/NormalIcon/DelA16.png'/></a>";
                                    <%}%>
                                }

                                return rtnHtml;
                            }
                        }
            ]]
        });

                    ///绑定刷新前事件
                    function BindOnBeforeRefresh() {
                        $('#list').treegrid('getPager').data("pagination").options.onBeforeRefresh = function (pageNumber, pageSize) {
                            $("#list").treegrid('options').url = 'WebPlatForm_Module.aspx?strFun=Get&RandomID=' + Math.random();
                        };
                    }
                    ///选中页面时事件
                    function BindOnSelectPage() {
                        $('#list').treegrid('getPager').pagination({
                            onSelectPage: function (pageNumber, pageSize) {
                                $("#list").treegrid('options').url = 'WebPlatForm_Module.aspx?strFun=Get'+'&page='+pageNumber+'&rows='+pageSize+'&RandomID=' + Math.random();
                                $("#list").treegrid('options').pageNumber =pageNumber;
                                
                                //$('#list').treegrid('getPager').pagination('refresh', {
                                //    pageNumber: pageNumber,
                                //    pageSize: pageSize
                                //});
                                $('#list').treegrid('reload');
                            }
                        });
                    }
                    //查询操作
                    function CheckQuery() {
                        var Options = {};
                        Options.url = encodeURI('WebPlatForm_Module.aspx?RandomID=' + Math.random());
                        Options.queryParams = {
                            strFun: 'Get'
                        };
                        $('#list').treegrid(Options);
                        //记录日志
                        SaveLog(5, window.location.pathname, "模块管理");
                    }

                    //添加web信息
                    function EditWebInfo(ID) {
                        artDialogOpen('/Page/Platform/Module_Information/Module_InformationEdit.aspx?EditId=' + ID + '&Identity=Power', '编辑web属性')
                    }

                    //添加web信息
                    function AddWebInfo(ID) {
                        artDialogOpen('/Page/Platform/Module_Information/Module_InformationEdit.aspx?strID=' + ID + '&Identity=Power', '添加web属性')
                    }

                    //添加
                    function Add() {
                        artDialogOpen('/Page/Platform/Module/Module_Edit.aspx', '添加模块', 405, 178);
                    }

                    //权限添加
                    function PowerAdd(strModuleID) {
                        artDialogOpen('/Page/Platform/Module/ModulePower_Edit.aspx?strModuleID=' + strModuleID, '添加功能', 405, 178);
                    }
                    // 编辑
                    function Edit(ID) {
                        artDialogOpen('/Page/Platform/Module/Module_Edit.aspx?EditId=' + ID, '编辑模块', 405, 178);
                    }
                    //权限编辑
                    function PowerEdit(ID) {
                        artDialogOpen('/Page/Platform/Module/ModulePower_Edit.aspx?EditId=' + ID, '编辑权限', 405, 178);
                    }
                    //禁用
                    function Disable(ID) {
                        AjaxPost("WebPlatForm_Module.aspx", { strID: ID, strFun: "disable" }, function (data) {
                            if (data == "true") {
                                publicDo('已成功禁用', 1);
                            }
                        });
                    }
                    //启用
                    function RemoveDisable(ID) {
                        AjaxPost("WebPlatForm_Module.aspx", { strID: ID, strFun: "removeDisable" }, function (data) {
                            if (data == "true") {
                                publicDo('已成功启用', 1);
                            }
                        });
                    }
                    //删除
                    function Del(ID) {
                        art.dialog({
                            content: '确定要删除该模块吗?删除后模块下属权限一并删除,所有人员对该模块的权限一并收回',
                            ok: function () {
                                AjaxGet('WebPlatForm_Module.aspx?strFun=Delete&strID=' + ID, "html", function (data) {
                                    if (data == "true") {
                                        publicDo('已成功删除模块', 1);
                                    }
                                });
                            },
                            cancelVal: '关闭',
                            cancel: true //为true等价于function(){}
                        });

                        //记录日志
                        SaveLog(3, window.location.pathname, "模块管理");
                    }

                    //删除
                    function PowerDel(ID) {
                        art.dialog({
                            content: '确定要删除该权限吗?删除后所有用户不再拥有该权限',
                            ok: function () {
                                AjaxGet('WebPlatForm_Module.aspx?strFun=PowerDelete&strPowerID=' + ID, "html", function (data) {
                                    if (data == "true") {
                                        publicDo('已成功删除权限', 1);
                                    }
                                });
                            },
                            cancelVal: '关闭',
                            cancel: true //为true等价于function(){}
                        });

                        //记录日志
                        SaveLog(3, window.location.pathname, "权限管理");
                    }

                    //页面刷新
                    function appdel_do() {
                        publicDo('操作成功', 1);
                    }
                    ///公用提示
                    function publicDo(strMessage,nSecond)
                    {
                        $("#list").treegrid('options').url = 'WebPlatForm_Module.aspx?strFun=Get&RandomID=' + Math.random();
                        $('#list').treegrid('reload');
                        art.dialog.tips(strMessage, nSecond);
                    }
    </script>

</asp:Content>

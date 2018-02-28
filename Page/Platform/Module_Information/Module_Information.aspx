<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="Module_Information, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        $(window).resize(function () {
            SetHeightWidth();
        });
        function SetHeightWidth() {
            $('#list').treegrid('resize', {
                width: $(window).width() - 20,
                height: $(window).height() - 20
            });
        }
        function beforeclick() {
            if ($("#<%=FUInPut.ClientID%>").val() == "") {
                alert("请选择导入文件");
                return false;
            }
            return true;
        }
        function Export() {
            AjaxGet("Module_Information.aspx?nType=1", "html", function (data) {
                $("#aExport").attr("href", "/Page/Platform/FileDownLoad.aspx?strPath=" + encodeURI(data));
                $("#clickSpan").click();
            });
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="SerachDiv" style="margin: 10px; border: 1px #DDDDDD solid; background-color: #FBFBFB; width: 98%;">
        <div style="width: 98%; margin-left: 10px; height: 55px; line-height: 55px; vertical-align: middle; border-radius: 5px;">

            <span style="float: left; margin-top: 10px;">
                <asp:FileUpload ID="FUInPut" Height="30" runat="server" /></span>
            <span style="float: left; margin-top: 10px;">
                <asp:Button ID="btInPut" runat="server" Style="margin-left: 10px;" Text="数据导入" OnClientClick="return beforeclick()" OnClick="btInPut_Click" /></span>
            <span style="float: right; margin-top: 10px;">
                <a href="#" onclick="Export()" class="btn btn_orange btn_export " style="margin-left: 10px; width: 100px;"><span>数据导出</span></a>
                <a id="aExport" href="#" target="_blank"><span id="clickSpan"></span></a></span>

        </div>
    </div>
    <div style="margin-left:10px;">
        <table id="list">
        </table>
    </div>

    <script type="text/javascript">
        BindTreeGrid();


        var CatoryTopID = "";
        ///绑定树形网格
        function BindTreeGrid() {
            CatoryTopID = "";
            var width = $("#SerachDiv").width() + 2;
            var height = $(window).height() - $("#SerachDiv").height() - 30;

            AjaxGet("/XmlConfig.xml", "xml", function (xml) {
                var id = $(xml).find("TopNav").text();
                $('#list').treegrid({
                    url: '/Page/Platform/Module_Information/ashx/Module_Information.ashx?strFun=GetTreeList',
                    idField: 'id',
                    treeField: 'strUrlDescription',
                    lines: true,
                    height: height,
                    fitColumns: true,
                    width: width,
                    loadMsg: '数据加载中,请稍候..',
                    rowStyler: function (row) {
                        if (row.hasOwnProperty("nEnable")) {
                            if (row.nEnable == "2") {
                                return 'color:#D4D4D4;';
                            }
                        }
                    },
                    onBeforeExpand:function(row)
                    {
                        if (row._parentId == "1")
                        {
                            CatoryTopID = "";
                            CatoryTopID = row.strURL.substring(row.strURL.indexOf('leftid=') + 7);
                            if (CatoryTopID != "")
                            {
                                try {
                                    $('#list').treegrid('refresh', CatoryTopID);
                                }
                                catch (error) { }
                            }
                        }
                    },
                    onLoadSuccess: function (row, data) {
                        
                        $('#list').treegrid('collapseAll');
                        $('#list').treegrid('expand', '1');
                        $(".datagrid-row").mouseover(function () {
                            if ($(this).children("td").eq(5).find(".ModuleInformationTopArrow").attr("alt") == "1") {
                                $(this).children("td").eq(5).find(".ModuleInformationTopArrow").show();
                            }
                            else {
                                $(this).children("td").eq(5).find(".CategoryTopArrow").show();
                            }
                        });
                        $(".datagrid-row").mouseout(function () {
                            $(this).children("td").eq(5).find(".ModuleInformationTopArrow").hide();
                            $(this).children("td").eq(5).find(".CategoryTopArrow").hide();
                        });
                    },
                    columns: [[
    		            { field: 'strUrlDescription', title: '模块名称', width: 185 },
    		            {
    		                title: 'Url地址', field: 'strURL', width: 250, formatter: function (val, row) {
    		                    return "<span title='" + val + "'>" + val + "</span>";
    		                }
    		            },
    		            { field: 'nsortid', title: '排序id', width: 45 },
    		            {
    		                field: '_blank', title: '新页面打开', width: 70, formatter: function (val, row) {
    		                    return (val == "1" ? "是" : "否");
    		                }
    		            },
    		            { field: 'strIconCss', title: '图标样式', width: 105 },
    		            {
    		                field: '_parentId', title: '操作', width: 165, align: "center", formatter: function (val, row) {
    		                    var ret = '';
    		                    var topstr = "";
    		                    if (val == "1") {
    		                        topstr = "<img class='ModuleInformationTopArrow' alt=" + val + " onclick=\"UpdateTopNav('" + row.id + "')\" onmouseover=\"this.src='/_Images/Platform/NormalIcon/Top11.png'\" onmouseout=\"this.src='/_Images/Platform/NormalIcon/TopWhite11.png'\" style='display:none;' title='设为网站首页' src='/_Images/Platform/NormalIcon/TopWhite11.png'/>";
    		                    }

    		                    else if (val != "1" && val != undefined) {

    		                        topstr = "<img class='CategoryTopArrow' alt=" + val + " onclick=\"CatoryTopNav('" + row.id + "')\" onmouseover=\"this.src='/_Images/Platform/NormalIcon/Category11.png'\" onmouseout=\"this.src='/_Images/Platform/NormalIcon/CategoryWhite11.png'\" style='display:none;' title='设为分类首页' src='/_Images/Platform/NormalIcon/CategoryWhite11.png'/>";

    		                    }
    		                    if (row.id == id) {
    		                        topstr = "<img title='网站首页'  src='/_Images/Platform/NormalIcon/Top11.png'/>";
    		                    }
    		                    if (row.id == CatoryTopID)
    		                    {
    		                        topstr = "<img title='分类首页'  src='/_Images/Platform/NormalIcon/Category11.png'/>";
    		                    }
    		                    if (row.nSource == '1') {
    		                        ret = "<a href='#'  onclick=\"PageConfig('" + row.id + "')\">[配置下属页面]</a>&nbsp;&nbsp;&nbsp;&nbsp;";
    		                        if (val == undefined || val == "1") {
    		                            ret += "<a href='#' onclick=\"Add('" + row.id + "')\" ><img title='新增分类' src='/_Images/Platform/NormalIcon/Add11.png'/></a>&nbsp;&nbsp;&nbsp;&nbsp;";
    		                        }
    		                        if (row.id != '1')
    		                            ret += "<a href='#'  onclick=\"Edit('" + row.id + "')\" ><img title='修改' src='/_Images/Platform/NormalIcon/Edit11.png'/></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=\"Del('" + row.id + "')\" ><img title='删除' src='/_Images/Platform/NormalIcon/Del11.png'/></a>";
    		                        
    		                    }
    		                    else {
    		                        ret = "<a href='#'  onclick=\"Edit('" + row.id + "')\" ><img title='修改' src='/_Images/Platform/NormalIcon/Edit11.png'/></a>";
    		                    }
    		                    ret += "&nbsp;&nbsp;&nbsp;&nbsp;<a href='#'>" + topstr + "</a>";
    		                    return ret;
    		                }
    		            }
                    ]]
                });
            });
        }

        ///设为分类首页
        function CatoryTopNav(id)
        {
            AjaxGet("Module_Information.aspx?nType=2&strID=" + id, "html", function (data) {
                if (data == "true")
                {
                    BindTreeGrid();
                    art.dialog.tips('操作成功', 1);
                }
                
            });
        }

        //更新网站首页
        function UpdateTopNav(id) {
            AjaxGet("/Page/Platform/Module_Information/ashx/Module_Information.ashx?strFun=UpdateTopNav&strTopNav=" + id, "html", function (data) {
                BindTreeGrid();
                art.dialog.tips('操作成功', 1);
            });
        }
        //添加
        function Add(ID) {
            artDialogOpen('/Page/Platform/Module_Information/Module_InformationEdit.aspx?strParentID=' + ID, '新增分类');
        }
        //编辑
        function Edit(ID) {
            artDialogOpen('/Page/Platform/Module_Information/Module_InformationEdit.aspx?EditId=' + ID, '编辑')
        }
        //删除
        function Del(ID) {
            TreeGridpublicDelete('/Page/Platform/Module_Information/ashx/Module_Information.ashx?strFun=Delete&parameters=' + ID, '确定要删除该项吗?');
            //记录日志
            SaveLog(3, window.location.pathname, "模块管理");

        }
        //页面配置
        function PageConfig(ID) {
            artDialogOpen('/Page/Platform/Module_Information/PageConfig.aspx?strModuleID=' + ID, '配置', 784, 467);
        }

        //页面刷新
        function appdel_do() {
            publicTreeGridShowResult("true");
        }
    </script>

</asp:Content>

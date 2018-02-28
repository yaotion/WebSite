<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="Dat_Log_List, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="/_JScripts/Platform/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" charset="gb2312" src="/_JScripts/Platform/frame/jquery.uniform.min.js"></script>


    <style type="text/css">
        #uniform-Type span
        {
            min-width: 70px;
        }
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

    <script type="text/javascript">
        var ncount = 0;
        //查询操作
        function CheckQuery() {
            setFirstPage("#list");
            var Options = {};
            Options.url = "/Page/Platform/Dat_Log/ashx/Dat_Log.ashx";
            Options.queryParams = {
                dtBeginTime: $("#txtBeginTime").val() != "" ? $("#txtBeginTime").val() + " 00:00:00" : "",
                dtEndTime: $("#txtEndTime").val() != "" ? $("#txtEndTime").val() + " 23:59:59" : "",
                nType: $("#Type").val(),
                strTrianManNumber: $("#TB_TrainManNumber").val()
            };
            $('#list').datagrid(Options);
            //记录日志
            SaveLog(5, window.location.pathname, "日志管理");
        }
        $(function() {
            var objs = $("td[field]");
            var lenght = objs.length;
            var strhtml = "";
            for (var i = 0; i < lenght; i++) {
                var text = objs[i].innerText;
                if (objs[i].innerText != "") {
                    strhtml += objs[i].innerText + "(" + $(objs[i]).attr("field") + "),";
                } 
            }
            CheckQuery();
            jQuery('input:checkbox, input:radio, select.uniformselect, input:file').uniform();
        })
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="SerachDiv" style="margin: 10px; border: 1px #DDDDDD solid; background-color: #FBFBFB;
        width: 98%;">
        <div style="margin-left: 10px; min-height: 55px; line-height: 55px; vertical-align: middle;
            border-radius: 5px; overflow: hidden">
            <div style="float: left;">
                时间:
                <input type="text" id="txtBeginTime" value="" onfocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'});" style='width: 125px; height: 10px;' />
                至
                <input type="text" id="txtEndTime" value="" onfocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'});" style='width:125px; height: 10px;' />
            </div>
            <div style="float: left;">
                类型:
                <select id="Type" class="uniformselect" >
                    <option value="">全部</option>
                    <option value="1">访问</option>
                    <option value="2">新增</option>
                    <option value="3">删除</option>
                    <option value="4">修改</option>
                    <option value="5">查询</option>
                </select></div>
            <div style="float: left;">
                工号:
                <input id='TB_TrainManNumber' style='width: 75px; height: 13px;' name="haha" type='text'
                    value='' /></div>
            <div style="float: left;">
                <a href="#" onclick="CheckQuery()" class="btn btn_orange btn_search " style="margin-left: 10px;
                    margin-top: 13px;"><span>查询</span></a></div>
        </div>

    </div>
    <div style="margin: 10px;">
        <div id="list">
        </div>
    </div>

    <script type="text/javascript">
        var listwidth = $("#SerachDiv").width()+2;
        var Listheight = $(window).height() - $("#SerachDiv").height() - 30;
        $('#list').datagrid({
            striped: true,
            width: listwidth,
            height: Listheight,
            singleSelect: true,
            loadMsg: '准备数据...',
            fitColumns: true,
            rownumbers: true,
            autoRowHeight: true,
            pagination: true,
            pageSize: 20,
            rowStyler: function(index, row) {
                if (row.nIsSuccess == "0") {
                    return 'background-color:Red;';
                }
            },
            pageList: [20, 40, 60],
            columns: [[
            { field: 'nType', title: '类型', width: 45, align: 'center', formatter: function(val, row) {
                switch (val) {
                    case "1":
                        return "<img src='/_Images/Platform/NormalIcon/View10.png'>&nbsp;&nbsp;访问";
                    case "2":
                        return "<img src='/_Images/Platform/NormalIcon/Add10.png'>&nbsp;&nbsp;新增";
                    case "3":
                        return "<img src='/_Images/Platform/NormalIcon/Del10.png'>&nbsp;&nbsp;删除";
                    case "4":
                        return "<img src='/_Images/Platform/NormalIcon/Edit10.png'>&nbsp;&nbsp;修改";
                    case "5":
                        return "<img src='/_Images/Platform/NormalIcon/Search10.png'>&nbsp;&nbsp;查询";
                }
            }
            },
        { field: 'strTrianManNumber', title: '工号', width: 45, align: 'center' },
        { field: 'dtPostTime', title: '时间', width: 130, align: 'center' },
        { field: 'strPageName', title: '页面名称', width: 130, align: 'center', formatter: function(val, row) {
            return "<div title='" + row.strPageUrl + "'>" + val + "</div>"
        }
        },
            { field: 'strClientIP', title: 'ip地址', width: 130, align: 'center' }
    ]]
        });  
    </script>

</asp:Content>

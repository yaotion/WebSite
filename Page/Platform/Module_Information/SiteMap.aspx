<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="SiteMap, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        $(window).resize(function() {
            SetHeightWidth();
        });
        function SetHeightWidth() {
            $('#list').treegrid('resize', {
                width: $(window).width() - 20,
                height: $(window).height() - 20
            });
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="ml10 mt10">
        <table id="list">
        </table>
    </div>

    <script type="text/javascript">
        BindTreeGrid();


        ///绑定树形网格
        function BindTreeGrid() {
            var width = 425;
            var height = 520;
            var nhidden = true;
            if (parseInt("<%=strRoleID%>") <= 2) {
                nhidden = false;
            }
            AjaxGet("/XmlConfig.xml", "xml", function(xml) {
                var id = $(xml).find("TopNav").text();
                $('#list').treegrid({
                    url: '/Page/Platform/Module_Information/ashx/Module_Information.ashx?page=1&rows=200&strFun=GetRoleModule',
                    idField: 'id',
                    treeField: 'strUrlDescription',
                    lines: true,
                    height: height,
                    fitColumns: true,
                    width: width,
                    loadMsg: '数据加载中,请稍候..',
                    columns: [[
    		{ field: 'strUrlDescription', title: '模块名称', width: 185, formatter: function(val, row) {
    		    if (row.nEnable == "2") {
    		        val="<font style='color:#D4D4D4'>"+val+"</font>";
    		    }
    		    return "<a href=\"" + row.strURL + "\" target=\"_blank\">"+val+"</a>";
    		} 
    		},
    		{ field: '_parentId', title: '操作', width: 100, align: "center", hidden: nhidden, formatter: function(val, row) {
    		    if (row.id != "2") {
    		        return "<table style=' margin:auto;'><tr>"
    		        + "<td style='width:26px;border:none;'><a href='#'  onclick=\"Edit('" + row.id + "')\" style='color:black;'><img title='修改' src='/_Images/Platform/NormalIcon/Edit11.png'/></a></td>"
    		        + "</tr></table>";
    		    }
    		}
    		}
        ]]
                });
            });
        }

        //编辑
        function Edit(ID) {
            artDialogOpen('/Page/Platform/Module_Information/SiteMapEdit.aspx?EditId=' + ID, '修改')
        }
        //页面刷新
        function appdel_do() {
            publicTreeGridShowResult("true");
        }     
    </script>

</asp:Content>

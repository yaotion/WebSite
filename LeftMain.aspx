
<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="LeftMain, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">



<script type="text/javascript">
    var Request = new Object();
    Request = GetRequest();
    $(function() {
        BindLeftNav();
        $('#LeftFrame').height($(window).height());
    })

    $(window).resize(function() {
    $('#LeftFrame').height($(window).height());
    $("#hhdiv").height(($(window).height()));
    });
    //绑定左侧导航
    function BindLeftNav() {
       
        var parentid = Request['parentid'];
        $("#hhdiv").height(($(window).height()));
        AjaxGet("/_Masters/ashx/MasterTabDiv.ashx?nType=2&strParentID=" + parentid, "html", function(data) {
            $("#LeftNavContent").html(data);
            ReBindvernav2();
            var id = Request['leftid'];
            if (id == "" || id == null || id == undefined) {
                GetNavDefaultValue();
            }
            else {
                if ($("#" + id).parent().attr("target") == "LeftFrame") {
                    //BindLeftNavColor(id, "LeftNav");
                    $("#" + id).trigger("click");
                    $("#LeftFrame").attr("src", $("#" + id).parent().attr("href"));
                    //解决默认选中在没有三级菜单的模块 默认隐藏问题
                    var TagA = $("#" + id).parent().parent().parent().siblings("a");
                    if (typeof (TagA.attr("href")) != "undefined") {
                        if (TagA.attr("href").indexOf("#") > -1) {
                            TagA.trigger("click");
                        }
                    }
                }
            }
        });
    }
    //绑定左侧导航选中色
    function BindLeftNavColor(id, name, parentID) {
        if (name != undefined && name != '') {
            $("div[name=" + name + "]").removeClass("ListNavSelect");
        }
        $("#" + id).attr("class", "ListNavSelect");
        if (parentID != undefined && parentID != '') {
            $("div[name=ModuleNav]").removeClass("ListNavSelect");
        }
        $("#moduleDiv" + parentID).attr("class", "ListNavSelect");
        //记录日志
        SaveLog(1, $("#" + id).parent().attr("href"), $("#" + id).html());
    }
    
    //获取配置文件中默认导航
    function GetNavDefaultValue() {
        AjaxGet("/XmlConfig.xml", "xml", function(xml) {
        var id = $(xml).find("LeftNav").text();
        BindLeftNavColor(id, "LeftNav");
        if ($("#" + id).parent().attr("target") == "LeftFrame") {
            $("#LeftFrame").attr("src", $("#" + id).parent().attr("href"));
            }
        });
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="withvernav">
            
            <div id="hhdiv" style="overflow:auto;" class="vernav2 iconmenu">
            <ul id="LeftNavContent">
        	
        </ul>
        <a class="togglemenu"></a>
        <br /><br />
            </div>
            <div id="FrameDiv" class="centercontent">
                <iframe id="LeftFrame" name="LeftFrame" title="正文内容" src="" width="100%" style=" min-height:200px; height:auto;" frameborder="no" border="0"
                    marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
            </div>
        </div>
</asp:Content>

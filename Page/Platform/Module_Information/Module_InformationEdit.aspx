<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="Module_InformationEdit, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" charset="gb2312" src="/_JScripts/Platform/frame/jquery.uniform.min.js"></script>
    <script type="text/javascript">
        ///// DROP DOWN BUTTON /////

        $(function () {

            $("ul.recent_list li").click(function () {
                var t = jQuery(this);

                $("#<%=strIconCss.ClientID%>").val($.trim(t.find(".msg").html()));
            });

            $('.dropdown').each(function () {
                var t = jQuery(this);
                t.find('a.dropdown_label').click(function () {
                    if (!t.hasClass('open')) {
                        var h = t.height();
                        t.find('ul').show().css({ top: h + 2 + 'px' });
                        t.addClass('open');
                    } else {
                        t.find('ul').hide();
                        t.removeClass('open');
                    }
                    return false;
                });

            });

        })

        $(document).click(function () {
            jQuery('.dropdown').removeClass('open').find('ul').hide();
        });
    </script>
    <style type="text/css">
        .selector span {
            min-width: 358px;
        }
    </style>

    <script type="text/javascript">
        var Request = new Object();
        Request = GetRequest();
        var strParentID = "<%=strParentID %>";
        $(function () {
            loadSWbutton();
            $("#<%=ParentID.ClientID%>").blur(function () {
                if ($("#<%=ParentID.ClientID%>").val() == "") {
                    if (strParentID == "") {
                        strParentID = Request['strParentID'];
                    }
                    $("#<%=ParentID.ClientID%>").val(strParentID);
                }
            });
            if ($("#<%=ParentID.ClientID%>").val() == "") {
                $("#<%=ParentID.ClientID%>").val(Request['strParentID']);
            }
            jQuery('input:checkbox, input:radio, select.uniformselect, input:file').uniform();

        })
        //加载切换按钮
        function loadSWbutton()
        {
            var bBlank = false;
            if ($("#<%=hf_Blank.ClientID%>").val() == "1")
            {
                bBlank = true;
            }
            $('#_blank').switchbutton({
                onText: "是",
                offText: "否",
                checked: bBlank,
                onChange: function (checked) {
                    $("#<%=hf_Blank.ClientID%>").val(checked == true ? 1 : 0);
                }
            });

            var bEnable = true;
            if ($("#<%=hf_Enable.ClientID%>").val() == "2")
            {
                bEnable = false;
            }
            $('#ddlnEnable').switchbutton({
                onText: "是",
                offText: "否",
                checked: bEnable,
                onChange: function (checked) {
                    $("#<%=hf_Enable.ClientID%>").val(checked == true ? 1 : 2);
                }
            });
        }

        function beforeSave() {
          <%--  if (isNullMessage("<%=strURL.ClientID%>", "请输入Url地址", "提醒") == false) {
                return false;
            }--%>
            if (isNullMessage("<%=strUrlDescription.ClientID%>", "请输入模块名称", "提醒") == false) {
                return false;
            }
            if (isNullMessage("<%=nsortid.ClientID%>", "请输入排序id", "提醒") == false) {
                return false;
            }
            return true;
        }
        function SetCss(cssName) {
            $("#<%=strIconCss.ClientID %>").val(cssName);
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hf_Blank" runat="server" />
    <asp:HiddenField ID="hf_Enable" runat="server" Value="1"/>
    <div style="width: 567px; height: 400px;">
        <div style="padding: 20px; clear: both;">
            <div style="clear: both; padding-top: 5px">
                <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                    strID:
                </div>
                <div style="float: left;">
                    <asp:Label ID="strID" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div  style="clear: both; padding-top: 5px;display:none;">
                <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                    父模块ID:
                </div>
                <div style="float: left;">
                    <input id='ParentID' runat="server" style='width: 390px; height: 13px;' type='text'
                        value='' />
                </div>
            </div>
            <div style="clear: both; padding-top: 5px">
                <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                    Url地址:
                </div>
                <div style="float: left;">
                    <input id='strURL' runat="server" style='width: 390px; height: 13px;' type='text'
                        value='' />
                </div>
            </div>
            <div style="clear: both; padding-top: 5px">
                <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                    模块名称:
                </div>
                <div style="float: left;">
                    <input id='strUrlDescription' runat="server" style='width: 390px; height: 13px;'
                        type='text' value='' /><font size="5px" color="red">*</font>
                </div>
            </div>
            <div style="clear: both; padding-top: 5px">
                <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                    排序id:
                </div>
                <div style="float: left;">
                    <input id='nsortid' runat="server" style='width: 390px; height: 13px;' type='text'
                        value='' /><font size="5px" color="red">*</font>
                </div>
            </div>
            <div style="clear: both; padding-top: 5px">
                <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                    新页面打开:
                </div>
                <div style="float: left;">
                    <input id="_blank" style="width:70px;height:30px"/>
                </div>
            </div>
            <div style="clear: both; padding-top: 5px">
                <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                    图标样式:
                </div>
                <div style="float: left;">
                    <table>
                        <tr>
                            <td>
                                <ul class="photosharing_menu">
                                    <li class="dropdown" id="actions">

                                        <a class="dropdown_label" href="#actions" style="padding: 0;">
                                            <input type="text" id='strIconCss' runat="server" style="border-radius: 0px; width: 388px;" />
                                            <span class="arrow dropdown_label"></span>
                                        </a>
                                        <ul class="recent_list" style="width: 400px; height: 100px; overflow: auto; cursor: pointer">
                                            <li>
                                                <div class="msg">
                                                </div>
                                            </li>
                                            <%=strCssList %>
                                        </ul>
                                    </li>
                                </ul>
                            </td>
                            <td>
                                <input type="button" value="..." title="上传自定义图标" onmouseover="style.backgroundColor='white'"
                                    onmouseout="style.backgroundColor='#f0f0f0'"
                                    style="margin-left: 5px; height: 30px; margin-top: 3px; border: solid 1px #CDCDCD;"
                                    onclick="artDialogOpen('/Page/Platform/Module_Information/UploadIcon.aspx', '上传自定义图标')" />
                            </td>
                        </tr>
                    </table>


                </div>
            </div>
            <div style="clear: both; padding-top: 5px">
                <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                    是否启用:
                </div>
                <div style="float: left;">
                    <input id="ddlnEnable" style="width:70px;height:30px"/>
                </div>
            </div>
            <div style="clear: both; height: 30px; padding-top: 20px; padding-left: 85px;">
                <asp:Button ID="BtnSave" runat="server" Text="确认" OnClientClick="return beforeSave();"
                    OnClick="BtnSave_Click" Style="padding: 0; width: 60px; height: 30px;" />
                <input type="button" id="btn_fb" value="取消" title="取消" style="width: 60px; height: 30px; margin-left: 5px;"
                    onclick="art.dialog.close();" />
            </div>
        </div>
    </div>
</asp:Content>

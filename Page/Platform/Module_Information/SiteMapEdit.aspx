<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="SiteMapEdit, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" charset="gb2312" src="/_JScripts/Platform/frame/jquery.uniform.min.js"></script>

    <style type="text/css">
        .selector span
        {
            min-width: 158px;
        }
    </style>

    <script type="text/javascript">
        $(function() {
            jQuery('input:checkbox, input:radio, select.uniformselect, input:file').uniform();
        })
        function beforeSave() {
            if (isNullMessage("<%=strUrlDescription.ClientID%>", "请输入模块名称", "提醒") == false) {
                return false;
            }
            return true;
        }                
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 376px; height: 165px;">
        <div style="padding: 20px; clear: both;">
            <div style="clear: both; padding-top: 5px">
                <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                    模块名称:
                </div>
                <div style="float: left;">
                    <input id='strUrlDescription' runat="server" style='width: 190px; height: 13px;'
                        type='text' value='' /><font size="5px" color="red">*</font>
                </div>
            </div>
            <div style="clear: both; padding-top: 5px">
                <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                    是否启用:
                </div>
                <div style="float: left;">
                    <select id="ddlnEnable" class="uniformselect" runat="server" style="width: 203px;">
                        <option value="1">启用</option>
                        <option value="2">禁用</option>
                    </select>
                </div>
            </div>
            <div style="clear: both; height: 30px; padding-top: 10px; padding-left: 85px;">
                <asp:Button ID="BtnSave" runat="server" Text="确认" OnClientClick="return beforeSave();"
                    OnClick="BtnSave_Click" Style="padding: 0; width: 60px; height: 30px;" />
                <input type="button" id="btn_fb" value="取消" title="取消" style="width: 60px; height: 30px;
                    margin-left: 5px;" onclick="art.dialog.close();" />
            </div>
        </div>
    </div>
</asp:Content>

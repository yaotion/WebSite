<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="Module_ModulePower_Edit, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="/_JScripts/Platform/frame/jquery.uniform.min.js"></script>
    <script type="text/javascript">
        ///保证powerID 格式正确
        function ExistPowerID(id) {
            if (event.keyCode == 8) {
                if (document.getElementById(id).value.length<=$("#<%=HFModuleID.ClientID%>").val().length) {
                    document.getElementById(id).value = $("#<%=HFModuleID.ClientID%>").val() + "_";
                }
            }
            
        }

        function beforeSave() {
            if (isNullMessage("<%=strPowerID.ClientID%>", "请输入功能ID", "提醒") == false) {
                return false;
            }
            if (isNullMessage("<%=strPowerName.ClientID%>", "请输入功能名称", "提醒") == false) {
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="HFModuleID" runat="server" />
    <div style="margin: 20px;">
        <div style="margin-top: 15px; height: 40px;">
            <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                功能ID:
            </div>
            <div style="float: left;">
                <input id='strPowerID' runat="server" style='width: 210px; height: 13px;'
                    type='text' value='' onkeyup="ExistPowerID(this.id)" /><font size="5px" color="red">*</font>
            </div>
        </div>
        <div style="clear: both; margin-top: 5px; height: 40px;">
            <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                功能名称:
            </div>
            <div style="float: left;">
                <input id='strPowerName' runat="server" style='width: 210px; height: 13px;'
                    type='text' value='' /><font size="5px" color="red">*</font>
            </div>
        </div>
        <div style="clear: both; height: 40px; width: 300px; margin-top: 10px;">
            <input type="button" id="btn_fb" value="取消" title="取消" style="width: 60px; height: 30px; margin-left: 5px; float: right;"
                onclick="art.dialog.close();" />
            <asp:Button ID="BtnSave" runat="server" Text="保存" OnClientClick="return beforeSave();"
                OnClick="BtnSave_Click" Style="width: 60px; height: 30px; float: right; margin-right: 10px;" />
        </div>

    </div>
</asp:Content>

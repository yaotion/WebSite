<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="Module_Module_Edit, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="/_JScripts/Platform/frame/jquery.uniform.min.js"></script>
    <script type="text/javascript">


        ///保证powerID 格式正确
        function ExistModuleID(id) {
            if (event.keyCode == 8) {
                if (document.getElementById(id).value.length <= 3) {
                    document.getElementById(id).value ="TF_";
                }
            }

        }

        function beforeSave() {
            if (isNullMessage("<%=strModuleID.ClientID%>", "请输入模块ID", "提醒") == false) {
                return false;
            }
            var strModuleID = $("#<%=strModuleID.ClientID%>").val();
            if (strModuleID.length > 3) {
                if (strModuleID.substring(0, 3) != "TF_")
                {
                    alert("模块ID必须以'TF_'开头");
                    return false;
                }
            }
            else {
                alert("模块id长度不符,请重新输入后重试");
                return false;
            }
            if (isNullMessage("<%=strModuleName.ClientID%>", "请输入模块名称", "提醒") == false) {
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 20px;">
        <div style="margin-top: 15px; height:40px;">
            <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                模块ID:
            </div>
            <div style="float: left;">
                <input id='strModuleID' runat="server" style='width: 210px; height: 13px;'
                    type='text' value='' onkeyup="ExistModuleID(this.id)"/><font size="5px" color="red">*</font>
            </div>
        </div>
        <div style="clear:both; margin-top: 5px;height:40px;">
            <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                模块名称:
            </div>
            <div style="float: left;">
                <input id='strModuleName' runat="server" style='width: 210px; height: 13px;'
                    type='text' value='' /><font size="5px" color="red">*</font>
            </div>
        </div>
            <div style="clear: both; height: 40px; width: 300px; margin-top:10px;">
                <input type="button" id="btn_fb" value="取消" title="取消" style="width: 60px; height: 30px; margin-left: 5px; float: right;"
                    onclick="art.dialog.close();" />
                <asp:Button ID="BtnSave" runat="server" Text="保存" OnClientClick="return beforeSave();"
                    OnClick="BtnSave_Click" Style="width: 60px; height: 30px; float: right; margin-right: 10px;" />
            </div>

    </div>
</asp:Content>

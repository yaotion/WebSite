<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="UserInfo_PassWordReset, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<script type="text/javascript" charset="gb2312" src="/_JScripts/Platform/frame/jquery.uniform.min.js"></script>
    <script type="text/javascript">

        function beforeSave() {
            if (isNullMessage("<%=TB_NewPassword.ClientID%>", "请输入新密码", "提醒") == false) {
                return false;
            }
            if (isNullMessage("<%=TB_ConfirmNewPassword.ClientID%>", "请确认新密码", "提醒") == false) {
                return false;
            }
            if ($("#<%=TB_NewPassword.ClientID%>").val() != $("#<%=TB_ConfirmNewPassword.ClientID%>").val()) {
                $.messager.alert("提示","新密码两次输入不一致");
                $("#<%=TB_ConfirmNewPassword.ClientID%>").val("");
                return false;
            }

            return true;
        }           
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div style="padding: 20px; clear: both;">
           
            <div style="clear: both; padding-top: 5px">
                <div style="float: left; width: 80px; padding-right:10px; text-align: right;">
                    原密码:
                </div>
                <div style="float: left;">
                    <input id='TB_oldPassword' type="password" runat="server" style='width: 180px; height: 13px;'
                        value='' />
                </div>
            </div>
            <div style="clear: both; padding-top: 15px">
                <div style="float: left; width: 80px;padding-right:10px; text-align: right;">
                    新密码:
                </div>
                <div style="float: left;">
                    <input id='TB_NewPassword' type="password" runat="server" style='width:180px; height: 13px;' 
                        value='' />
                </div>
            </div>
           <div style="clear: both; padding-top: 15px">
                <div style="float: left; width: 80px;padding-right:10px; text-align: right;">
                    确认新密码:
                </div>
                <div style="float: left;">
                    <input id='TB_ConfirmNewPassword' type="password" runat="server" style='width:180px; height: 13px;' 
                        value='' />
                </div>
            </div>
            <div style="clear: both; height: 25px; padding-top: 20px; padding-left: 90px;">
                <asp:Button ID="BtnSave" runat="server" Text="确认" OnClientClick="return beforeSave();"
                        OnClick="BtnSave_Click"  Style="padding: 0; width: 60px; height: 25px;"
                         />
                    <input type="button" id="btn_fb" value="取消" title="取消"  style="width: 60px;
                        height: 25px; margin-left: 15px;" 
                        onclick="art.dialog.close();" />
            </div>
        </div>
    </div>
</asp:Content>

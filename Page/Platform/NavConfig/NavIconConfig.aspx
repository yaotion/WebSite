<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="NavConfig_NavIconConfig, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<script type="text/javascript" charset="gb2312" src="/_JScripts/Platform/frame/jquery.uniform.min.js"></script>
    <script type="text/javascript">
        $(function() {
        jQuery('input:checkbox, input:radio, select.uniformselect, input:file').uniform();        
        })
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div style="padding: 20px; clear: both;">
           
            <div style="clear: both; padding-top: 5px">
                <div style="float: left; width: 90px;  text-align: right;">
                    <input id="chknav" type="checkbox" runat="server"/>&nbsp;
                </div>
               启用导航图标
            </div>
            <div style="clear: both; height: 25px; padding-top: 20px; padding-left: 60px;">
                <asp:Button ID="BtnSave" runat="server" Text="确认" 
                        OnClick="BtnSave_Click"  Style="padding: 0; width: 60px; height: 25px;"
                         />
                    <input type="button" id="btn_fb" value="取消" title="取消"  style="width: 60px;
                        height: 25px; margin-left: 15px;" 
                        onclick="art.dialog.close();" />
            </div>
        </div>
    </div>
</asp:Content>

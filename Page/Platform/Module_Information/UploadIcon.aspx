<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="UploadIcon, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="/_JScripts/Platform/Uploadify/uploadify.css" rel="stylesheet" type="text/css" />

    <script src="/_JScripts/Platform/Uploadify/jquery.uploadify.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function() {

            $("#file_upload").uploadify({
                height: 20,
                'fileSizeLimit': '2MB',
                swf: "/_JScripts/Platform/Uploadify/uploadify.swf",
                uploader: 'UploadIcon.aspx?nType=1',
                auto: false,

                buttonText: '浏览',
                onUploadComplete: function(file) {
                    var name = file.name;
                    $("#<%=FileName.ClientID %>").val(name);
                    $("#<%=CssName.ClientID %>").val(".icon-" + name.substring(0, name.lastIndexOf(".")));
                    $("#<%=CssName.ClientID %>").focus();
                    $("#tbyl").attr("src", "/文件/Icons/" + name)
                }
            });

        });
        function beforeSave() {
            if ($("#<%=FileName.ClientID %>").val() == "") {
                alert("请先上传图标");
                return false;
            }
            return true;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 560px; height: 135px;">
        <div style="float: left; width: 380px; height: 135px;">
            <div style="margin-left: 65px; margin-top: 15px;">
                <div style="float: left; width: 220px;">
                    <span id="file_upload"></span><span style="color:red;">建议上传16*16的图标</span>
                </div>
                <div style="float: left;">
                    <input type="button" value="上传" style="height: 24px; border: solid 1px #CDCDCD;"
                        onclick="$('#file_upload').uploadify('upload','*')" /></div>
            </div>
            <div style="clear: both; padding-top: 8px;">
                <div style="float: left; width: 60px; text-align: right;">
                    文件名称:
                </div>
                <div style="float: left; padding-left: 5px;">
                    <input id='FileName' runat="server" style='width: 290px; height: 13px;' type='text' readonly="readonly"
                        value='' />
                </div>
            </div>
            <div style="clear: both; padding-top: 15px;">
                <div style="float: left; width: 60px; text-align: right;">
                    样式名称:
                </div>
                <div style="float: left; padding-left: 5px;">
                    <input id='CssName' runat="server" style='width: 290px; height: 13px;' type='text' value='' />
                </div>
            </div>
        </div>
        <div style="float: left; width: 140px; height: 135px; padding-top: 10px;">
            图标预览:
            <div style="width: 140px; height: 100px; border: solid 1px #CDCDCD; overflow:auto;">
                <img id="tbyl" />
            </div>
        </div>
    </div>
    <div style=" text-align:right; padding-right:10px; width:520px; height:50px; ">
    
                <input type="button" id="btn_fb" value="取消" title="取消" style="width: 60px; height: 30px; 
                    float:right;" onclick="art.dialog.close();" />
                     <asp:Button ID="BtnSave" runat="server" Text="确认" OnClientClick="return beforeSave();"
                    OnClick="BtnSave_Click" style="width: 60px; height: 30px; float:right; margin-right:10px;" />
    </div>
</asp:Content>

<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="Page_Platform_ConnectionConfig_Edit, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        //初始化
        $(function () {
            setHeight();
        });
        //页面自适应
        $(window).resize(function () {
            setHeight();
        });
        //设置高度
        function setHeight() {
            $('#divLayout').height($(window).height() - 3);
        }
        function beforeSave() {
            if (isNullMessage("<%=WebSiteName.ClientID%>", "请输入站点名称", "提醒") == false) {
                return false;
            }
            if (isNullMessage("<%=WebSiteVersion.ClientID%>", "请输入程序版本号", "提醒") == false) {
                return false;
            }
            if (isNullMessage("<%=SqlIP.ClientID%>", "请输入数据库ip地址", "提醒") == false) {
                return false;
            }
            if (isNullMessage("<%=DataBaseName.ClientID%>", "请输入数据库名称", "提醒") == false) {
                return false;
            }
            if (isNullMessage("<%=SqlName.ClientID%>", "请输入数据库用户名", "提醒") == false) {
                return false;
            }
            return true;
        }
    </script>
    <style type="text/css">
        .usespan {
            width: 250px;
            display: block;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="divLayout" style="overflow: auto;">
        <div style="padding: 20px; clear: both;">
            <div style="clear: both; padding-top: 5px">
                <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                    站点名称:
                </div>
                <div style="float: left;">
                    <input id='WebSiteName' runat="server" style='width: 390px; height: 13px;' type='text'
                        value='' /><font size="5px" color="red">*</font>
                </div>
            </div>
            <div style="clear: both; padding-top: 5px">
                <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                    站点端口:
                </div>
                <div style="float: left;">
                    <input id='SitePort' runat="server" style='width: 390px; height: 13px;' type='text'
                        value='' />
                </div>
            </div>
            <div style="clear: both; padding-top: 5px">
                <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                    系统版本号:
                </div>
                <div style="float: left;">
                    <input id='WebSiteVersion' runat="server" style='width: 390px; height: 13px;' type='text'
                        value='' /><font size="5px" color="red">*</font>
                </div>
            </div>
            <div style="clear: both; padding-top: 5px">
                <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                    数据库地址:
                </div>
                <div style="float: left;">
                    <input id='SqlIP' runat="server" style='width: 390px; height: 13px;' type='text'
                        value='' /><font size="5px" color="red">*</font>
                </div>
            </div>
            <div style="clear: both; padding-top: 5px">
                <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                    数据库名称:
                </div>
                <div style="float: left;">
                    <input id='DataBaseName' runat="server" style='width: 390px; height: 13px;' type='text'
                        value='' /><font size="5px" color="red">*</font>
                </div>
            </div>
            <div style="clear: both; padding-top: 5px">
                <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                    数据库用户名:
                </div>
                <div style="float: left;">
                    <input id='SqlName' runat="server" style='width: 390px; height: 13px;' type='text'
                        value='' /><font size="5px" color="red">*</font>
                </div>
            </div>
            <div style="clear: both; padding-top: 5px">
                <div style="float: left; width: 80px; text-align: right; padding-right: 5px;">
                    数据库密码:
                </div>
                <div style="float: left;">
                    <input id='SqlPassWord' type="text" runat="server" style='width: 390px; height: 13px;'
                        value='0' />
                </div>
            </div>
            <div style="clear: both; height: 30px; padding-top: 10px; padding-left: 85px;">
                <asp:Button ID="BtnSave" runat="server" Text="确认" OnClientClick="return beforeSave();"
                    OnClick="BtnSave_Click" Style="padding: 0; width: 60px; height: 30px;" />
            </div>
        </div>
        <div style="margin: 20px;">
            <div class="contenttitle2">
                <h3>自定义logo 【点击“更换按钮”更换logo】</h3>
            </div>
            <div style="margin-bottom: 20px;display:none;">

                <input id="logo" type="file" accept=".png" onchange="filePost('logo','logo',54,43)" />
                <input id="favicon" type="file" accept=".ico" onchange="filePost('favicon','favicon',16,16)" />
                <input id="logoLogin" type="file" accept=".png" onchange="filePost('logoLogin','logoLogin',129,114)" />
                 <input id="avatar" type="file" accept=".png" onchange="filePost('avatar','avatar',27,27)" />
                <input id="avatarBig" type="file" accept=".png" onchange="filePost('avatarBig','avatarBig',95,95)" />

            </div>
            <ul class="buttonlist">
                <li>
                    <img src='<%=(TF.CommonUtility.XmlClass.Read("XmlConfig.xml","/XmlConfig/logo/favicon")=="0"?"/_Images/Platform/LogoImg":"/文件/LogoImg")%>/favicon.ico?v=<%=TF.CommonUtility.XmlClass.Read("SysConfig.xml", "/SysConfig/logoImg/version") %>>' alt="" /><br /><br />
                    <input type="button" value="更换" runat="server" onclick="getFile('favicon')" /><div class="usespan">像素：16*16 *.ico 透明</div>
                </li>
                <li>
                    <img src='<%=(TF.CommonUtility.XmlClass.Read("XmlConfig.xml","/XmlConfig/logo/logo")=="0"?"/_Images/Platform/LogoImg":"/文件/LogoImg")%>/logo.png?v=<%=TF.CommonUtility.XmlClass.Read("SysConfig.xml", "/SysConfig/logoImg/version") %>>' style='background-color: #212E3E;' alt="" /><br /><br />
                    <input type="button" value="更换" runat="server" onclick="getFile('logo')" /><div class="usespan">像素：54*43 *.png 透明</div>
                </li>
                <li>
                    <img src='<%=(TF.CommonUtility.XmlClass.Read("XmlConfig.xml","/XmlConfig/logo/logoLogin")=="0"?"/_Images/Platform/LogoImg":"/文件/LogoImg")%>/logoLogin.png?v=<%=TF.CommonUtility.XmlClass.Read("SysConfig.xml", "/SysConfig/logoImg/version") %>>' style='background-color: #212E3E;' alt="" /><br /><br />
                    <input type="button" value="更换" runat="server" onclick="getFile('logoLogin')" /><div class="usespan">像素：129*114 *.png 透明</div>
                </li>
            </ul>
            <ul class="buttonlist">
                <li>
                    <img src='<%=(TF.CommonUtility.XmlClass.Read("XmlConfig.xml","/XmlConfig/logo/avatar")=="0"?"/_Images/Platform/LogoImg":"/文件/LogoImg")%>/avatar.png?v=<%=TF.CommonUtility.XmlClass.Read("SysConfig.xml", "/SysConfig/logoImg/version") %>>' alt="" /><br /><br />
                    <input type="button" value="更换" runat="server" onclick="getFile('avatar')" /><div class="usespan">像素：27*27 *.png 透明</div>
                </li>
                <li>
                    <img src='<%=(TF.CommonUtility.XmlClass.Read("XmlConfig.xml","/XmlConfig/logo/avatarBig")=="0"?"/_Images/Platform/LogoImg":"/文件/LogoImg")%>/avatarBig.png?v=<%=TF.CommonUtility.XmlClass.Read("SysConfig.xml", "/SysConfig/logoImg/version") %>>' alt="" /><br /><br />
                    <input type="button" value="更换" runat="server" onclick="getFile('avatarBig')" /><div class="usespan">像素：95*95 *.png 透明</div>
                </li>
            </ul>
             <div class="contenttitle2">
                <h3>自定义样式包(<a href="/文件/样式包/temp.zip" style="width:60px;color:blue;text-decoration:underline;">下载</a>)</h3>
            </div>            
            <div>
                <input id="filetheme" type="file" accept=".zip"/>
                主题色:<input id="taThemeColor" type="text" style="width:120px;height:16px;"/>
                <input style="margin-left:20px;" type="button" value="上传" onclick="fileStylePost('filetheme')" />
            </div>
            <ul style="color:red;margin-top:10px;">
                <li>1.压缩包里只包含一个文件夹，文件夹以样式名称命名；（例：filename）</li>
                <li>2.文件夹里包含一个css文件和一个images文件夹，images文件夹里是该样式包引用的图片文件，css文件命名方式为:style.样式名称.css；（例：style.filename.css） </li>
                <li>3.文件夹名称与样式文件名的样式名称保持一致。</li>
                <li>4.样式名称不能以数字开头，否则无法识别。</li>
            </ul>
        </div>
    </div>
    <script type="text/javascript">
        //获取文件
        function getFile(id) {
            $("#"+id).click();
        }
        //上传图片 id:fileid type:logo  w:宽 h：高
        function filePost(id, type, w, h) {
            var input = document.getElementById(id);
            if (input.files) {
                //读取图片数据  
                var f = input.files[0];
                if (type == "favicon")
                {
                    if (f.type != "image/x-icon")
                    {
                        $.messager.alert("提示", "请选择正确的文件类型（*.ico）");
                        return false;
                    }
                }
                else if (f.type != "image/png")
                {
                    $.messager.alert("提示", "请选择正确的文件类型（*.png）");
                    return false;
                }
                var reader = new FileReader();
                reader.onload = function (e) {
                    var data = e.target.result;
                    //加载图片获取图片真实宽度和高度  
                    var image = new Image();
                    image.onload = function () {
                        var width = image.width;
                        var height = image.height;
                        if (width != w)
                        {
                            $.messager.alert("提示","图片宽度应为" + w + "px,此图片为"+width+"px");
                            return false;
                        }
                        if (height != h) {
                            $.messager.alert("提示", "图片高度应为" + h + "px,此图片为" + height + "px");
                            return false;
                        }
                        UploadFile(f, type);
                    };
                    image.src = data;
                };
                reader.readAsDataURL(f);
            }
        }
        //上传文件
        function UploadFile(f,type) {
            var fileObj = f; // 获取文件对象
            var FileController = "Edit.aspx?strFun=SaveLogo";                    // 接收上传文件的后台地址
            // FormData 对象
            var form = new FormData();
            form.append("type", type);                        // 可以增加表单数据
            form.append("file", fileObj);                           // 文件对象
            // XMLHttpRequest 对象
            var xhr = new XMLHttpRequest();
            xhr.open("post", FileController, true);
            xhr.onload = function () {
                window.location.reload();
            };
            xhr.send(form);
        }

        //上传文件 id:fileid 
        function fileStylePost(id) {
            if (isNullMessage("filetheme", "请选择一个样式包(*.zip)", "提醒") == false) {
                return false;
            }
            if (isNullMessage("taThemeColor", "请输入主题色", "提醒") == false) {
                return false;
            }            
            var input = document.getElementById(id);
            if (input.files) {
                //读取图片数据  
                var f = input.files[0];
                if (f.type != "application/x-zip-compressed") {
                    $.messager.alert("提示", "请选择正确的文件类型（*.zip）");
                    return false;
                }
                UploadStyleFile(f);
            }
        }
        //上传文件
        function UploadStyleFile(f) {
            var fileObj = f; // 获取文件对象
            var FileController = "/Page/ashx/PublicFunction.ashx?strFun=SaveStyle";                    // 接收上传文件的后台地址

            // FormData 对象
            var form = new FormData();                 // 可以增加表单数据
            form.append("color", $("#taThemeColor").val());
            form.append("fname", f.name);
            form.append("file", fileObj);                           // 文件对象
            // XMLHttpRequest 对象
            var xhr = new XMLHttpRequest();
            xhr.open("post", FileController, true);
            xhr.onload = function () {
                art.dialog.tips("操作成功", 3);
            };
            xhr.send(form);
        }      
    </script>
</asp:Content>

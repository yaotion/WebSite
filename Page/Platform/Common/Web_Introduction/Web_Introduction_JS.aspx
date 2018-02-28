<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="Page_Platform_Common_Web_Introduction_Web_Introduction_JS, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        //初始化
        $(function () {
            setHeight();
            opentree('JS/Other.html');
        });
        //页面自适应
        $(window).resize(function () {
            setHeight();
        });
        //设置高度
        function setHeight() {
            var divLayout = $('#divLayout');
            divLayout.layout('resize', {
                height: ($(window).height())
            });

            $('#CenterFrame').height($(window).height() - 5);
        }
        //打开
        function opentree(url) {
            $("#CenterFrame").attr("target", "CenterFrame");
            $("#CenterFrame").attr("src", url);
        }

    </script>
    <style type="text/css">
 
      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div id="divLayout" class="easyui-layout" style="width: 100%;">
            <div data-options="region:'west'" title="导航" style="width: 300px; padding: 10px;">
                <ul class="easyui-tree">                    
                    <li><span><a href="#" onclick="opentree('JS/Other.html')">【三方控件】</a></span>
                        <ul>
                            <li><a href="#" onclick="opentree('JS/Other.html#uniform')">uniform(美化控件)</a></li>
                            <li><a href="#" onclick="opentree('JS/Other.html#My97DatePicker')">My97DatePicker(日历控件)</a></li>
                        </ul>
                    </li>
                    <li><span><a href="#" onclick="opentree('JS/PlatAsynchronous.html')">PlatAsynchronous.js【异步相关】</a></span>
                        <ul>
                            <li><a href="#" onclick="opentree('JS/PlatAsynchronous.html#AjaxGetJson')">AjaxGetJson</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatAsynchronous.html#AjaxPost')">AjaxPost</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatAsynchronous.html#AjaxGet')">AjaxGet</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatAsynchronous.html#loadScript')">loadScript</a></li>
                        </ul>
                    </li>
                    <li><span><a href="#" onclick="opentree('JS/PlatBrowser.html')">PlatBrowser.js【浏览器相关】</a></span>
                        <ul>
                            <li><a href="#" onclick="opentree('JS/PlatBrowser.html#GetRequest')">GetRequest</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatBrowser.html#allinfo')">allinfo</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatBrowser.html#getPluginName')">getPluginName</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatBrowser.html#checkePlugs')">checkePlugs</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatBrowser.html#isIe')">isIe</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatBrowser.html#isFireFox')">isFireFox</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatBrowser.html#cpuInfo')">cpuInfo</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatBrowser.html#softDisk')">softDisk</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatBrowser.html#RomInfo')">RomInfo</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatBrowser.html#keyBoardInfo')">keyBoardInfo</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatBrowser.html#mainBoard')">mainBoard</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatBrowser.html#disk')">disk</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatBrowser.html#raminfo')">raminfo</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatBrowser.html#ipinfo')">ipinfo</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatBrowser.html#pcInfo')">pcInfo</a></li>
                        </ul>
                    </li>
                    <li><span><a href="#" onclick="opentree('JS/PlatControl.html')">PlatControl.js【控件相关】</a></span>
                        <ul>
                            <li><a href="#" onclick="opentree('JS/PlatControl.html#yyyymmDateBox')">yyyymmDateBox</a></li>
                        </ul>
                    </li>
                    <li><span><a href="#" onclick="opentree('JS/PlatCss.html')">PlatCss.js【样式相关】</a></span>
                        <ul>
                            <li><a href="#" onclick="opentree('JS/PlatCss.html#setGradient')">setGradient</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatCss.html#RGB2Color')">RGB2Color</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatCss.html#byte2Hex')">byte2Hex</a></li>
                        </ul>
                    </li>
                    <li><span><a href="#" onclick="opentree('JS/PlatDate.html')">PlatDate.js【时间相关】</a></span>
                        <ul>
                            <li><a href="#" onclick="opentree('JS/PlatDate.html#fmttt')">Date.prototype.fmttt</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatDate.html#setTime')">setTime</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatDate.html#compareCalendar')">compareCalendar</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatDate.html#compareDate')">compareDate</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatDate.html#compareTime')">compareTime</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatDate.html#MinutesToChineseHM')">MinutesToChineseHM</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatDate.html#SecondToChineseDHM')">SecondToChineseDHM</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatDate.html#SecondToHHmmss')">SecondToHHmmss</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatDate.html#StrFormatReturnDate')">StrFormatReturnDate</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatDate.html#getdate')">getdate</a></li>
                        </ul>
                    </li>
                    <li><span><a href="#" onclick="opentree('JS/PlatDialogMessage.html')">PlatDialogMessage.js【弹框相关】</a></span>
                        <ul>
                            <li><a href="#" onclick="opentree('JS/PlatDialogMessage.html#Message')">Message</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatDialogMessage.html#artDialogOpen')">artDialogOpen</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatDialogMessage.html#windowopen')">windowopen</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatDialogMessage.html#openFullWindow')">openFullWindow</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatDialogMessage.html#ajaxLoading')">ajaxLoading</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatDialogMessage.html#ajaxLoadEnd')">ajaxLoadEnd</a></li>
                        </ul>
                    </li>
                    <li><span><a href="#" onclick="opentree('JS/PlatText.html')">PlatText.js【字符串相关】</a></span>
                        <ul>
                            <li><a href="#" onclick="opentree('JS/PlatText.html#format')">String.prototype.format</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatText.html#cutcomma')">cutcomma</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatText.html#toCutWordWrap')">toCutWordWrap</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatText.html#trim')">String.prototype.trim</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatText.html#ltrim')">String.prototype.ltrim</a></li>
                            <li><a href="#" onclick="opentree('JS/PlatText.html#rtrim')">String.prototype.rtrim</a></li>
                        </ul>
                    </li>
                     <li><span><a href="#" onclick="opentree('JS/SystemLogic.html')">SystemLogic.js【系统通用相关】</a></span>
                        <ul>
                            <li><a href="#" onclick="opentree('JS/SystemLogic.html#SetHeightWidth')">SetHeightWidth</a></li>
                            <li><a href="#" onclick="opentree('JS/SystemLogic.html#SaveLog')">SaveLog</a></li>
                            <li><a href="#" onclick="opentree('JS/SystemLogic.html#publicDelete')">publicDelete</a></li>
                            <li><a href="#" onclick="opentree('JS/SystemLogic.html#TreeGridpublicDelete')">TreeGridpublicDelete</a></li>
                            <li><a href="#" onclick="opentree('JS/SystemLogic.html#publicDeleteReload')">publicDeleteReload</a></li>
                            <li><a href="#" onclick="opentree('JS/SystemLogic.html#publicShowResult')">publicShowResult</a></li>
                             <li><a href="#" onclick="opentree('JS/SystemLogic.html#publicTreeGridShowResult')">publicTreeGridShowResult</a></li>
                            <li><a href="#" onclick="opentree('JS/SystemLogic.html#isNullMessage')">isNullMessage</a></li>
                            <li><a href="#" onclick="opentree('JS/SystemLogic.html#ConvertFileSize')">ConvertFileSize</a></li>
                            <li><a href="#" onclick="opentree('JS/SystemLogic.html#bytesToSize')">bytesToSize</a></li>
                            <li><a href="#" onclick="opentree('JS/SystemLogic.html#setFirstPage')">setFirstPage</a></li>
                        </ul>
                    </li>
                </ul>

            </div>
            <div data-options="region:'center'" >
                <div style="width: 100%;">
                    <iframe id="CenterFrame" name="CenterFrame" title="正文内容" src="" width="100%" style="min-height: 200px; height: auto;" frameborder="no" border="0"
                        marginwidth="0" marginheight="0" scrolling="yes" allowtransparency="yes"></iframe>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

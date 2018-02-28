<%@ page language="C#" masterpagefile="~/_Masters/show.master" autoeventwireup="true" inherits="Page_Platform_Common_Web_Introduction_Web_Introduction_CSS, Platform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="/_JScripts/Platform/My97DatePicker/WdatePicker.js"></script>
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
    </script>
    <style type="text/css">
        .usespan {
            width: 250px;
            display: block;
        }
        .contentwrapper { padding: 20px; }
        .lineheight21 { line-height: 21px; }

        .whitelist{
            padding:5px;
            background-color:#808080;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="divLayout" style="overflow: auto; border: 1px solid #DDDDDD;">
        <div id="contentwrapper" class="contentwrapper lineheight21">
            <div class="contenttitle2">
                <h3>普通按钮样式</h3>
                举例：&lt;a href="#" class="btn btn_orange btn_search"&gt;&lt;span&gt;查询&lt;/span&gt;&lt;/a&gt;
            </div>
            <ul class="buttonlist">
                <li><a href="#" class="btn btn_orange btn_search"><span>查询</span></a><span class="usespan">使用：class="btn btn_orange btn_search"</span></li>
                <li><a href="#" class="btn btn_orange btn_add"><span>添加</span></a><span class="usespan">使用：class="btn btn_orange btn_add"</span></li> 
                <li><a href="#" class="btn btn_orange btn_edit"><span>修改</span></a><span class="usespan">使用：class="btn btn_orange btn_edit"</span></li> 
                <li><a href="#" class="btn btn_orange btn_del"><span>删除</span></a><span class="usespan">使用：class="btn btn_orange btn_del"</span></li>
                <li><a href="#" class="btn btn_orange btn_trash"><span>删除</span></a><span class="usespan">使用：class="btn btn_orange btn_trash"</span></li>
                <li><a href="#" class="btn btn_orange btn_import"><span>导入</span></a><span class="usespan">使用：class="btn btn_orange btn_import"</span></li>
                <li><a href="#" class="btn btn_orange btn_export"><span>导出</span></a><span class="usespan">使用：class="btn btn_orange btn_export"</span></li>
                <li><a href="#" class="btn btn_orange btn_print"><span>打印</span></a><span class="usespan">使用：class="btn btn_orange btn_print"</span></li>
                <li><a href="#" class="btn btn_orange btn_refresh"><span>刷新</span></a><span class="usespan">使用：class="btn btn_orange btn_refresh"</span></li>
                <li><a href="#" class="btn btn_orange btn_home"><span>主页</span></a><span class="usespan">使用：class="btn btn_orange btn_home"</span></li>
                <li><a href="#" class="btn btn_orange btn_settings"><span>设置</span></a><span class="usespan">使用：class="btn btn_orange btn_settings"</span></li>
                <li><a href="#" class="btn btn_orange btn_settings2"><span>设置</span></a><span class="usespan">使用：class="btn btn_orange btn_settings2"</span></li>
                <li><a href="#" class="btn btn_orange btn_settings3"><span>设置</span></a><span class="usespan">使用：class="btn btn_orange btn_settings3"</span></li>
                <li><a href="#" class="btn btn_orange btn_right"><span>正确</span></a><span class="usespan">使用：class="btn btn_orange btn_right"</span></li>
                 <li><a href="#" class="btn btn_orange btn_wrong"><span>错误</span></a><span class="usespan">使用：class="btn btn_orange btn_wrong"</span></li>
            </ul>
            <br />

            <div class="contenttitle2">
                <h3>小图标按钮</h3>
                举例：&lt;a href="#" class="btnsmall btnsmall_view"&gt;&lt;span&gt;访问&lt;/span&gt;&lt;/a&gt;
            </div>
            <ul class="buttonlist">
                <li><a href="#" class="btnsmall btnsmall_search"><span>查询</span></a><span class="usespan">使用：class="btnsmall btnsmall_search"</span></li>
                <li><a href="#" class="btnsmall btnsmall_add"><span>新增</span></a><span class="usespan">使用：class="btnsmall btnsmall_add"</span></li>
                <li><a href="#" class="btnsmall btnsmall_edit"><span>修改</span></a><span class="usespan">使用：class="btnsmall btnsmall_edit"</span></li>
                <li><a href="#" class="btnsmall btnsmall_del"><span>删除</span></a><span class="usespan">使用：class="btnsmall btnsmall_del"</span></li>
                <li><a href="#" class="btnsmall btnsmall_view"><span>访问</span></a><span class="usespan">使用：class="btnsmall btnsmall_view"</span></li>
            </ul>
            <br />

            <div class="contenttitle2">
                <h3>中图标按钮</h3>
                举例：&lt;a href="#"  title="新增"  class="btnmiddle btnmiddle3 btnmiddle_add"&gt;&lt;/a&gt;               
            </div>
            <ul class="buttonlist">
                <li><a href="#" title="新增" class="btnmiddle btnmiddle3 btnmiddle_add"></a><span class="usespan">使用：class="btnmiddle btnmiddle3 btnmiddle_add"</span></li>
                <li><a href="#" title="修改" class="btnmiddle btnmiddle3 btnmiddle_edit"></a><span class="usespan">使用：class="btnmiddle btnmiddle3 btnmiddle_edit"</span></li>
                <li><a href="#" title="删除" class="btnmiddle btnmiddle3 btnmiddle_del"></a><span class="usespan">使用：class="btnmiddle btnmiddle3 btnmiddle_del"</span></li>
                <li><a href="#" title="删除不可用" class="btnmiddle btnmiddle3 btnmiddle_delDisable"></a><span class="usespan">使用：class="btnmiddle btnmiddle3 btnmiddle_delDisable"</span></li>
                <li><a href="#" title="首页" class="btnmiddle btnmiddle3 btnmiddle_top"></a><span class="usespan">使用：class="btnmiddle btnmiddle3 btnmiddle_top"</span></li>
                <li><a href="#" title="首页未选中" class="btnmiddle btnmiddle3 btnmiddle_topUnSelect"></a><span class="usespan">使用：class="btnmiddle btnmiddle3 btnmiddle_topUnSelect"</span></li>
            </ul>
            <div class="contenttitle2">               
                举例：&lt;a href="#" class="btnmiddle btnmiddle4 btnmiddle_up"&gt;&lt;span&gt;上移&lt;/span&gt;&lt;/a&gt;
            </div>
            <ul class="buttonlist">
                <li><a href="#" class="btnmiddle btnmiddle4 btnmiddle_up"><span>上移</span></a><span class="usespan">使用：class="btnmiddle btnmiddle4 btnmiddle_up"</span></li>
                <li><a href="#" class="btnmiddle btnmiddle4 btnmiddle_down"><span>下移</span></a><span class="usespan">使用：class="btnmiddle btnmiddle4 btnmiddle_down"</span></li>
                <li><a href="#" class="btnmiddle btnmiddle4 btnmiddle_print"><span>打印</span></a><span class="usespan">使用：class="btnmiddle btnmiddle4 btnmiddle_print"</span></li>
                <li><a href="#" class="btnmiddle btnmiddle4 btnmiddle_printcheck"><span>打印核对</span></a><span class="usespan">使用：class="btnmiddle btnmiddle4 btnmiddle_printcheck"</span></li>
                <li><a href="#" class="btnmiddle btnmiddle4 btnmiddle_printpreview"><span>打印预览</span></a><span class="usespan">使用：class="btnmiddle btnmiddle4 btnmiddle_printpreview"</span></li>
            </ul>
            <br />

            <div class="contenttitle2">
                <h3>常用控件</h3>
            </div>
            <ul class="buttonlist">
                <li>输入框80px：<input type="text" class="width80" /><span style="margin-left: 10px;">使用：&lt;input type="text" class="width80"/&gt;</span> </li>
                <br />
                <li>日期框80px：<input type="text" class="width80" onfocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'});" /><span style="margin-left: 10px;">使用：&lt;input type="text" class="width80" onfocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'});" /&gt;</span> </li>
                <br />
                <li>时间框120px：<input type="text" class="width120" onfocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm:ss'});" /><span style="margin-left: 10px;">使用：&lt;input type="text" class="width120" onfocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'});" /&gt;</span> </li>
            </ul>
            <br />
            <div class="contenttitle2">
                <h3>图标</h3>
                像素：10*10  透明   
            </div>
            <ul class="buttonlist">
                <li><img alt="Add10" src="/_Images/Platform/NormalIcon/Add10.png" />(新增)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Add10.png)</span></li>   
                <li><img alt="Del10" src="/_Images/Platform/NormalIcon/Del10.png" />(删除)<span class="usespan">url(/_Images/Platform/NormalIcon<br />/Del10.png)</span></li>    
                <li><img alt="Edit10" src="/_Images/Platform/NormalIcon/Edit10.png" />(修改)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Edit10.png)</span></li>    
                <li><img alt="Search10" src="/_Images/Platform/NormalIcon/Search10.png" />(查询)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Search10.png)</span></li>    
                <li><img alt="Add10" src="/_Images/Platform/NormalIcon/View10.png" />(访问)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/View10.png)</span></li>               
            </ul>     
             <div class="contenttitle2">               
                 像素：11*11  透明 
            </div>
               <ul class="buttonlist">
                <li><img alt="Add11" src="/_Images/Platform/NormalIcon/Add11.png" />(新增)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Add11.png)</span></li>   
                <li><img alt="Del11" src="/_Images/Platform/NormalIcon/Del11.png" />(删除)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Del11.png)</span></li>    
                <li><img alt="DelWhite11" src="/_Images/Platform/NormalIcon/DelWhite11.png" />(删除灰色)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/DelWhite11.png)</span></li>    
                <li><img alt="Edit11" src="/_Images/Platform/NormalIcon/Edit11.png" />(修改)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Edit11.png)</span></li>    
                <li><img alt="Top11" src="/_Images/Platform/NormalIcon/Top11.png" />(置顶)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Top11.png)</span></li>     
                <li><img alt="TopWhite11" src="/_Images/Platform/NormalIcon/TopWhite11.png" />(置顶灰色)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/TopWhite11.png)</span></li>               
            </ul>
           <div class="contenttitle2">               
                 像素：15*15  透明 
            </div>
               <ul class="buttonlist">
                <li><img alt="Password15" src="/_Images/Platform/NormalIcon/Password15.png" />(密码)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Password15.png)</span></li>   
                <li><img alt="User15" src="/_Images/Platform/NormalIcon/User15.png" />(用户名)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/User15.png)</span></li>    
            </ul>
            <div class="contenttitle2">               
                 像素：16*16  透明，黑色
            </div>
               <ul class="buttonlist">
                <li><img alt="Add16" src="/_Images/Platform/NormalIcon/Add16.png" />(新增)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Add16.png)</span></li>     
                <li><img alt="Del16" src="/_Images/Platform/NormalIcon/Del16.png" />(删除)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Del16.png)</span></li>    
                <li><img alt="DelA16" src="/_Images/Platform/NormalIcon/DelA16.png" />(删除)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/DelA16.png)</span></li>     
                <li><img alt="Edit16" src="/_Images/Platform/NormalIcon/Edit16.png" />(修改)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Edit16.png)</span></li>  
                    
                 <li><img alt="Export16" src="/_Images/Platform/NormalIcon/Export16.png" />(导出)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Export16.png)</span></li>
                <li><img alt="Import16" src="/_Images/Platform/NormalIcon/Import16.png" />(导入)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Import16.png)</span></li>  
                <li><img alt="Print16" src="/_Images/Platform/NormalIcon/Print16.png" />(打印)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Print16.png)</span></li>     
                <li><img alt="Refresh16" src="/_Images/Platform/NormalIcon/Refresh16.png" />(刷新)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Refresh16.png)</span></li>  
                <li><img alt="Right16" src="/_Images/Platform/NormalIcon/Right16.png" />(正确)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Right16.png)</span></li>   
                   
                   <li><img alt="Search16" src="/_Images/Platform/NormalIcon/Search16.png" />(查询)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Search16.png)</span></li>   
                <li><img alt="Setting16" src="/_Images/Platform/NormalIcon/Setting16.png" />(设置)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Setting16.png)</span></li>    
                <li><img alt="SettingA16" src="/_Images/Platform/NormalIcon/SettingA16.png" />(设置)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/SettingA16.png)</span></li>    
                <li><img alt="SettingB16" src="/_Images/Platform/NormalIcon/SettingB16.png" />(设置)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/SettingB16.png)</span></li>    
                <li><img alt="Wrong16" src="/_Images/Platform/NormalIcon/Wrong16.png" />(错误)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Wrong16.png)</span></li> 
                      
                <li><img alt="Home16" src="/_Images/Platform/NormalIcon/Home16.png" />(主页)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Home16.png)</span></li>    
                <li><img alt="Calendar16" src="/_Images/Platform/NormalIcon/Calendar16.png" />(日历)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Calendar16.png)</span></li>    
                <li><img alt="Call16" src="/_Images/Platform/NormalIcon/Call16.png" />(电话)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Call16.png)</span></li>        
                     
                <li><img alt="Users16" src="/_Images/Platform/NormalIcon/Users16.png" />(用户)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Users16.png)</span></li>     
                <li><img alt="Mail16" src="/_Images/Platform/NormalIcon/Mail16.png" />(邮件)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Mail16.png)</span></li>        
            </ul>    
             <div class="contenttitle2">               
                 像素：16*16  透明，白色
            </div>
               <ul class="buttonlist">
                <li><img alt="AddWhite16" src="/_Images/Platform/NormalIcon/AddWhite16.png" class="whitelist" />(新增)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/AddWhite16.png)</span></li>     
                <li><img alt="DelWhite16" src="/_Images/Platform/NormalIcon/DelWhite16.png"  class="whitelist"/>(删除)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/DelWhite16.png)</span></li>    
                <li><img alt="DelAWhite16" src="/_Images/Platform/NormalIcon/DelAWhite16.png"  class="whitelist"/>(删除)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/DelAWhite16.png)</span></li>     
                <li><img alt="EditWhite16" src="/_Images/Platform/NormalIcon/EditWhite16.png"  class="whitelist"/>(修改)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/EditWhite16.png)</span></li>  
                    
                 <li><img alt="ExportWhite16" src="/_Images/Platform/NormalIcon/ExportWhite16.png"  class="whitelist"/>(导出)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/ExportWhite16.png)</span></li>
                <li><img alt="ImportWhite16" src="/_Images/Platform/NormalIcon/ImportWhite16.png"  class="whitelist"/>(导入)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/ImportWhite16.png)</span></li>    
               <li><img alt="PrintWhite16" src="/_Images/Platform/NormalIcon/PrintWhite16.png"  class="whitelist"/>(打印)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/PrintWhite16.png)</span></li>     
                <li><img alt="RefreshWhite16" src="/_Images/Platform/NormalIcon/RefreshWhite16.png"  class="whitelist"/>(刷新)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/RefreshWhite16.png)</span></li>  
                <li><img alt="RightWhite16" src="/_Images/Platform/NormalIcon/RightWhite16.png"  class="whitelist"/>(正确)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/RightWhite16.png)</span></li>   
                   
                   <li><img alt="SearchWhite16" src="/_Images/Platform/NormalIcon/SearchWhite16.png"  class="whitelist"/>(查询)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/SearchWhite16.png)</span></li>   
                <li><img alt="SettingWhite16" src="/_Images/Platform/NormalIcon/SettingWhite16.png"  class="whitelist"/>(设置)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/SettingWhite16.png)</span></li>    
                <li><img alt="SettingAWhite16" src="/_Images/Platform/NormalIcon/SettingAWhite16.png"  class="whitelist"/>(设置)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/SettingAWhite16.png)</span></li>    
                <li><img alt="SettingBWhite16" src="/_Images/Platform/NormalIcon/SettingBWhite16.png"  class="whitelist"/>(设置)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/SettingBWhite16.png)</span></li>    
               <li><img alt="WrongWhite16" src="/_Images/Platform/NormalIcon/WrongWhite16.png"  class="whitelist"/>(错误)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/WrongWhite16.png)</span></li> 
                      
                <li><img alt="HomeWhite16" src="/_Images/Platform/NormalIcon/HomeWhite16.png"  class="whitelist"/>(主页)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/HomeWhite16.png)</span></li>    
                 </ul>    
             <div class="contenttitle2">               
                 像素：24*24  透明 
            </div>
               <ul class="buttonlist">
                <li><img alt="Up24" src="/_Images/Platform/NormalIcon/Up24.png" />(上移)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Up24.png)</span></li>  
                <li><img alt="Down24" src="/_Images/Platform/NormalIcon/Down24.png" />(下移)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Down24.png)</span></li>   
                <li><img alt="Print24" src="/_Images/Platform/NormalIcon/Print24.png" />(打印)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/Print24.png)</span></li>    
                <li><img alt="PrintCheck24" src="/_Images/Platform/NormalIcon/PrintCheck24.png" />(打印核对)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/PrintCheck24.png)</span></li>   
                <li><img alt="PrintPreview24" src="/_Images/Platform/NormalIcon/PrintPreview24.png" />(打印预览)<span class="usespan">url(/_Images/Platform/NormalIcon<br/>/PrintPreview24.png)</span></li>  
                    
            </ul>
            <br />
        </div>
    </div>

</asp:Content>

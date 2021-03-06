
/// 页面输出错误提示
function Message(strContent, title) {
    art.dialog({ title: title, content: strContent });
}
// 打开对话框 参数依次为 string地址、string标题、int宽、int高、bool是否锁屏
function artDialogOpen(url,strTitle,width,height,lock) {
    art.dialog.open(url, { title: strTitle, width: width, height: height, lock: lock });
}

//打开一个新窗口
function windowopen(url) {
    window.open(url, "", "scrollbars=1,fullscreen=1")
}
//全屏打开新窗口
function openFullWindow(url, winname) {
    var strFeatures = "left=0,screenX=0,top=0,screenY=0";
    if (window.screen) {
        //获取屏幕的分辨率
        var maxh = screen.availHeight - 30;
        var maxw = screen.availWidth - 10;
        strFeatures += ",height=" + maxh;
        strFeatures += ",innerHeight" + maxh;
        strFeatures += ",width=" + maxw;
        strFeatures += ",innerwidth" + maxw;
    }
    else {
        strFeatures += ",resizable";

    }
    window.open(url, "", strFeatures);
}

//Loading提示
function ajaxLoading() {
    $("<div class=\"datagrid-mask\"></div>").css({ display: "block", width: "100%", height: $(window).height() }).appendTo("body");
    $("<div class=\"datagrid-mask-msg\"></div>").html("正在处理，请稍候...").appendTo("body").css({ display: "block", left: ($(document.body).outerWidth(true) - 190) / 2, top: ($(window).height() - 45) / 2 });
}
function ajaxLoadEnd() {
    $(".datagrid-mask").remove();
    $(".datagrid-mask-msg").remove();
}
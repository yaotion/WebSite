
//绑定resize事件
function BindResize() {
    //页面resize事件
    $(window).resize(function () {
        SetHeightWidth();
    });
}
//重设datagrid宽高
function SetHeightWidth() {
    if ($('#list') != undefined && $('#list') != null) {
        if ($('#list').length > 0) {
            $('#list').datagrid('resize', {
                width: $("#SerachDiv").width(),
                height: $(window).height() - $("#SerachDiv").height() - 30
            });
        }
    }
}
//记录日志
function SaveLog(nType, strPageUrl, strPageName) {
    try {
        AjaxGet("/Page/Platform/Dat_Log/ashx/Dat_Log.ashx?parameters=add&nType=" + nType + "&strPageUrl=" + strPageUrl + "&strPageName=" + strPageName, "html", function (data) { });
    }
    catch (err)
    { }
}

//公用删除
function publicDelete(url, content) {
    content = typeof (content) == "undefined" ? "确定删除这条数据吗" : content;
    art.dialog({
        content: content,
        ok: function() {
            AjaxGet(url, "html", publicShowResult);
        },
        cancelVal: '关闭',
        cancel: true //为true等价于function(){}
    });
}
//公用删除
function TreeGridpublicDelete(url, content) {
    content = typeof (content) == "undefined" ? "确定删除这条数据吗" : content;
    art.dialog({
        content: content,
        ok: function() {
            AjaxGet(url, "html", function (data) {
                publicTreeGridShowResult(data);
            });
        },
        cancelVal: '关闭',
        cancel: true //为true等价于function(){}
    });
}
//公用删除 刷新页面
function publicDeleteReload(url, content) {
    content = typeof (content) == "undefined" ? "确定删除这条数据吗" : content;
    art.dialog({
        content: content,
        ok: function() {
            AjaxGet(url, "html", function(data) {
                window.location.reload();
            });
        },
        cancelVal: '关闭',
        cancel: true //为true等价于function(){}
    });
}
//公用删除成功后提示
function publicShowResult(data) {
    if (data == "true") {
        $("#list").datagrid('reload');
        art.dialog.tips('操作成功', 1);
    }
    return false;
}
//公用删除成功后提示
function publicTreeGridShowResult(data) {
    if (data == "true") {
        $('#list').treegrid('reload');
        art.dialog.tips('操作成功', 1);
    }
    return false;
}
//判断控件值是否为空
function isNullMessage(id, content, tle, focus) {
    id = document.getElementById(id);
    if (id.value == "" || id.value == "--请选择--") {
        $.messager.alert('提示', content, "question", function() {
            if (focus != false) {
                if (id != null && id != undefined)
                {
                    id.focus();
                }
            }
        });
        return false;
    }
    return true;
}

//转换文件大小接收b返回kb，mb
function ConvertFileSize(fSize, retain) {
    var size = parseFloat(fSize);
    if (size < 1024)
        return fSize + "B";
    if (size < 1024 * 1024)
        return (size / 1024).toFixed(retain).toString() + "KB";
    if (size < 1024 * 1024 * 1024)
        return (size / 1024 / 1024).toFixed(retain).toString() + "MB";
    else
        return "";
}


//字节转换
function bytesToSize(bytes) {
    if (bytes === 0 || bytes == "0") return '0 B';
    var k = 1024, // or 1024
        sizes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],
        i = Math.floor(Math.log(bytes) / Math.log(k));
    return (bytes / Math.pow(k, i)).toPrecision(3) + ' ' + sizes[i];
}
//查询后返回第一页
function setFirstPage(ids) {
    var opts = $(ids).datagrid('options');
    var pager = $(ids).datagrid('getPager');
    opts.pageNumber = 1;
    opts.pageSize = opts.pageSize;
    pager.pagination('refresh', {
        pageNumber: 1,
        pageSize: opts.pageSize
    });
}


/*******************************************
功能：Ajax Post提交返回Json数据
参数：posturl 请求地址
paras 参数 
callback 回调方法
事例：AjaxPost("localhost", {}, callback, false)
*******************************************/
function AjaxGetJson(url, paras, callback) {
    $.ajax({
        type: "POST",
        contentType: "application/x-www-form-urlencoded; charset=utf-8", //防止form表单提交时出现乱码
        dataType: "json",
        cache: false,
        url: url,
        data: paras,
        timeout: 10000,
        success: function(data) { if (callback) callback(data); },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            callback({ "error": 1, "message": "AjaxRequestTimeout", "result": "" });
        }
    });
}
/*******************************************
功能：Ajax Post提交返回HTML数据
参数：posturl 请求地址
paras 参数 
callback 回调方法
事例：AjaxPost("localhost", {}, callback, false)
*******************************************/
function AjaxPost(url, paras, callback) {
    $.ajax({
        type: "POST",
        contentType: "application/x-www-form-urlencoded; charset=utf-8", //防止form表单提交时出现乱码
        cache: false,
        url: encodeURI(url),
        data: paras,
        timeout: 10000,
        success: function(data) { if (callback) callback(data); },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            callback({ "error": 1, "message": "AjaxRequestTimeout", "result": "" });
        }
    });
}

/*******************************************
功能：Ajax Post提交返回HTML数据
参数：posturl 请求地址
paras 参数 
callback 回调方法
事例：AjaxPost("localhost", {}, callback, false)
*******************************************/
function AjaxGet(url, datatype, callback) {
    $.ajax({
        type: "get",
        dataType: datatype,
        contentType: "application/x-www-form-urlencoded; charset=utf-8", //防止form表单提交时出现乱码
        cache: false,
        url: encodeURI(url),
        timeout: 100000,
        success: function(data) { if (callback) callback(data); },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            callback({ "error": 1, "message": "AjaxRequestTimeout", "result": "" });
        }
    });
}

//异步按顺序加载js 调用方法loadScript.load(["b.js", "a.js"])
var loadScript = (function() {
    var loadOne = function(url) {
        var dtd = $.Deferred();
        var node = document.createElement('script');
        node.type = "text/javascript";
        var onload = function() {
            dtd.resolve();
        };
        $(node).load(onload).bind('readystatechange', function() {
            if (node.readyState == 'loaded') {
                onload();
            }
        });
        document.getElementsByTagName('head')[0].appendChild(node);
        node.src = url;
        return dtd.promise();
    };

    var load = function(urls) {
        if (!$.isArray(urls)) {
            return load([urls]);
        }
        var ret = [];
        for (var i = 0; i < urls.length; i++) {
            ret[i] = loadOne(urls[i]);
        };
        return $.when.apply($, ret);
    }

    return {
        load: load
    };
})();

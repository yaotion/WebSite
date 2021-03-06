
//js 字符类型扩展format方法
String.prototype.format = function(args) {
    var result = this;
    if (arguments.length > 0) {
        if (arguments.length == 1 && typeof (args) == "object") {
            for (var key in args) {
                if (args[key] != undefined) {
                    var reg = new RegExp("({" + key + "})", "g");
                    result = result.replace(reg, args[key]);
                }
            }
        }
        else {
            for (var i = 0; i < arguments.length; i++) {
                if (arguments[i] != undefined) {
                    //var reg = new RegExp("({[" + i + "]})", "g");//这个在索引大于9时会有问题
                    var reg = new RegExp("({)" + i + "(})", "g");
                    result = result.replace(reg, arguments[i]);
                }
            }
        }
    }
    return result;
}

//去掉字符串首尾符号 str：字符串 nt：前nt位 后nt位 fh：去掉的符号
function cutcomma(str, nt, fh) {
    str = str.replace(/(^\s*)|(\s*$)/g, "");
    if (str.length > 0) {
        str = str.substring(0, nt) == fh ? str.substring(nt) : str;
        str = str.substring(str.length - nt) == fh ? str.substring(0, str.length - nt) : str;
    }
    return str;
}

//字符串按限定长度自动换行
function toCutWordWrap(strWord, intLen) {
    var strContent = strWord;
    var strTemp = "";
    if (strContent != undefined && strContent != null && strContent != NaN && strContent != "") {
        while (strContent.length > intLen) {
            strTemp += strContent.substr(0, intLen) + "<br />";
            strContent = strContent.substr(intLen, strContent.length);
        }
        strTemp += strContent;
    }
    return strTemp;
}

//js 字符类型扩展trim方法
String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, "");
}
//js 字符类型扩展ltrim方法
String.prototype.ltrim = function () {
    return this.replace(/(^\s*)/g, "");
}
//js 字符类型扩展rtrim方法
String.prototype.rtrim = function () {
    return this.replace(/(\s*$)/g, "");
}
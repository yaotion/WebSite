
//给Date增加format属性
Date.prototype.fmttt = function(format) {
    var o = {
        "M+": this.getMonth() + 1, //month   
        "d+": this.getDate(),    //day  
        "h+": this.getHours(),   //hour   
        "m+": this.getMinutes(), //minute   
        "s+": this.getSeconds(), //second   
        "q+": Math.floor((this.getMonth() + 3) / 3), //quarter  
        "S": this.getMilliseconds() //millisecond 
    }
    if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
}

//将日期字符串格式化为fmtt格式日期返回
function setTime(str, fmtt) {
     if (str == "" || str == undefined || str == null) {
        return "";
    }
    var tmCompare = new Date("1900/01/01 00:00:00");
    var reg = new RegExp("-", "g");
    var tm = new Date(str.replace(reg, "/"));
    if (tm < tmCompare) {
        return "";
    }
    return tm.fmttt(fmtt);
}

//比较时间入口 时间字符串格式为 “2017-01-01”或  “2017-01-01 01:00:00”
function compareCalendar(startDate, endDate) {
    if (startDate.indexOf(" ") != -1 && endDate.indexOf(" ") != -1) {
        //包含时间，日期   
        return compareTime(startDate, endDate);
    } else {
        //不包含时间，只包含日期   
        return compareDate(startDate, endDate);
    }
}

//compareCalendar附属方法 比对不带时间的日期字符串
function compareDate(checkStartDate, checkEndDate) {
    var arys1 = new Array();
    var arys2 = new Array();
    if (checkStartDate != null && checkEndDate != null) {
        arys1 = checkStartDate.split('-');
        var sdate = new Date(arys1[0], parseInt(arys1[1] - 1), arys1[2]);
        arys2 = checkEndDate.split('-');
        var edate = new Date(arys2[0], parseInt(arys2[1] - 1), arys2[2]);
        if (sdate < edate) {
            return true;
        }
        else {
            return false;
        }
    }
}

//compareCalendar附属方法 比对带时间的时间字符串
function compareTime(startDate, endDate) {
    if (startDate.length > 0 && endDate.length > 0) {
        var startDateTemp = startDate.split(" ");
        var endDateTemp = endDate.split(" ");

        var arrStartDate = startDateTemp[0].split("-");
        var arrEndDate = endDateTemp[0].split("-");

        var arrStartTime = startDateTemp[1].split(":");
        var arrEndTime = endDateTemp[1].split(":");

        var allStartDate = new Date(arrStartDate[0], arrStartDate[1], arrStartDate[2], arrStartTime[0], arrStartTime[1], arrStartTime[2]);
        var allEndDate = new Date(arrEndDate[0], arrEndDate[1], arrEndDate[2], arrEndTime[0], arrEndTime[1], arrEndTime[2]);

        if (allStartDate.getTime() < allEndDate.getTime()) {
            return true;
        }
        else {
            return false;
        }
    }
    else {
        return false;
    }
}



//例如 200分钟 返回3时20分
function MinutesToChineseHM(nMinutes) {
    var i = parseFloat(nMinutes);
    if (i < 0 || nMinutes == "") {
        return "0时0分";
    }

    var m = 0;
    m = i >= 60 ? Math.floor(i / 60) : 0;
    var s = i - m * 60;
    var t = "";
    t += m < 10 ? "0" + m.toString() : m.toString();
    t += "时";
    t += s < 10 ? "0" + s.toString() : s.toString();
    return t + "分";
}
//例如86400秒 返回1天0时0分 
function SecondToChineseDHM(nSeconds) {
    var i = parseFloat(nSeconds);
    if (i < 0 || nSeconds == "" || nSeconds == undefined) {
        return "";
    }

    var m = 0;
    var d = 0;
    var returnstr = "";
    d = i >= 86400 ? Math.floor(i / 86400) : 0;
    returnstr += d != 0 ? d + "天" : "";
    i = i - d * 86400;
    m = i >= 3600 ? Math.floor(i / 3600) : 0;
    returnstr += m + "时";
    i = i - m * 3600;
    var s = i >= 60 ? Math.floor(i / 60) : 0;
    returnstr += s + "分";
    return returnstr;
}
//36000秒入 返回10:00:00
function SecondToHHmmss(nSeconds) {
    var i = parseFloat(nSeconds);
    if (i < 0 || nSeconds == "") {
        return "00:00:00";
    }

    var h = 0;
    h = i >= 3600 ? Math.floor(i / 3600) : 0;
    var m = (i - h * 3600) >= 60 ? Math.floor((i - h * 3600) / 60) : 0;
    var t = "";
    t += h < 10 ? "0" + h.toString() : h.toString();
    t += ":";
    m = m >= 60 ? Math.floor(m / 60) : m;
    t += m < 10 ? "0" + m.toString() : m.toString();
    var s = parseInt(i % 60);
    t += ":";
    t += s < 10 ? "0" + s.toString() : s.toString();
    return t;
}

//将日期字符串格式化日期返回
function StrFormatReturnDate(str) {
    if (typeof (str) !="string")
    {
        return "";
    }
    var tm = new Date(str.replace(/\-/g, "/"));
    return tm;
}

//获取当前日期yyyy-mm-dd
function getdate() {
    var now = new Date()
    y = now.getFullYear()
    m = now.getMonth() + 1
    d = now.getDate()
    h = now.getHours()
    f = now.getMinutes()
    s = now.getSeconds()
    m = m < 10 ? "0" + m : m
    d = d < 10 ? "0" + d : d
    h = h < 10 ? "0" + h : h
    f = f < 10 ? "0" + f : f
    s = s < 10 ? "0" + s : s
    return y + "-" + m + "-" + d + ' ' + h + ':' + f + ':' + s
}
//时间相减返回秒数 输入参数时间字符串
function datediff(dt1, dt2) {
    if (dt1 == "" || dt2 == "") {
        return 0;
    }
    var total = (StrFormatReturnDate(dt1) - StrFormatReturnDate(dt2)) / 1000;
    return total;
}
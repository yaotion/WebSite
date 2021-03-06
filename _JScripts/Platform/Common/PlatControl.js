//只显示年月的日历控件
function yyyymmDateBox(id) {
    var buttons = $.extend([], $.fn.datebox.defaults.buttons);
    buttons.splice(0, 1, {
        text: ''
    });
    $('#' + id).datebox({
        buttons: buttons
    });
    $('#' + id).datebox({
        onShowPanel: function() {
            span.trigger('click'); 
            if (!tds) setTimeout(function() {
                tds = p.find('div.calendar-menu-month-inner td');
                tds.click(function(e) {
                    e.stopPropagation(); 
                    var year = /\d{4}/.exec(span.html())[0]//得到年份
                        , month = parseInt($(this).attr('abbr'), 10); //月份
                    $('#db').datebox('hidePanel')//隐藏日期对象
                        .datebox('setValue', year + '-' + (parseInt(month) + 1)); //设置日期的值
                });
            }, 0)
        },
        parser: function(s) {//配置parser，返回选择的日期

            if (!s) return new Date();
            var arr = s.split('-');
            return new Date(parseInt(arr[0], 10), parseInt(arr[1], 10) - 1, 1);
        },
        formatter: function(d) {
            var month = parseInt(d.getMonth());
            var year = parseInt(d.getFullYear());
            if (month == 0) {
                year -= 1;
                month = 12;
            }
            else if (month > 0 && month <= 9) {
                month = "0" + month;
            }

            return year + '-' + month;
        } //配置formatter，只返回年月
    });
    var p = $('#' + id).datebox('panel'), //日期选择对象
            tds = false, //日期选择对象中月份
            span = p.find('span.calendar-text'); //显示月份层的触发控件
}

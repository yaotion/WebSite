
function ReBindvernav2(e) {

    jQuery('.vernav > ul li a, .vernav2 > ul li a').each(function() {
        var url = jQuery(this).attr('href');
        if (url.toString().indexOf('#') > -1) {
            jQuery(this).click(function() {
                if (jQuery(url).length > 0) {
                    if (jQuery(url).is(':visible')) {
                        if (!jQuery(this).parents('div').hasClass('menucoll') &&
					   !jQuery(this).parents('div').hasClass('menucoll2'))
                            jQuery(url).slideUp();
                    } else {
                        jQuery('.vernav ul ul, .vernav2 ul ul').each(function() {
                            jQuery(this).slideUp();
                        });
                        if (!jQuery(this).parents('div').hasClass('menucoll') &&
					   !jQuery(this).parents('div').hasClass('menucoll2'))
                            jQuery(url).slideDown();
                    }
                    return false;
                }
            });
        }
    });

}

jQuery(document).ready(function() {


    ///// SHOW/HIDE USERDATA WHEN USERINFO IS CLICKED ///// 

    jQuery('.userinfo').click(function() {
        if (!jQuery(this).hasClass('active')) {
            jQuery('.userinfodrop').show();
            jQuery(this).addClass('active');
        } else {
            jQuery('.userinfodrop').hide();
            jQuery(this).removeClass('active');
        }
        //remove notification box if visible
        jQuery('.notification').removeClass('active');
        jQuery('.noticontent').remove();

        return false;
    });


    ///// SHOW/HIDE NOTIFICATION /////

    jQuery('.notification a').click(function() {
        var t = jQuery(this);
        var url = t.attr('href');
        if (!jQuery('.noticontent').is(':visible')) {
            jQuery.post(url, function(data) {
                t.parent().append('<div class="noticontent">' + data + '</div>');
            });
            //this will hide user info drop down when visible
            jQuery('.userinfo').removeClass('active');
            jQuery('.userinfodrop').hide();
        } else {
            t.parent().removeClass('active');
            jQuery('.noticontent').hide();
        }
        return false;
    });





    ///// SHOW/HIDE VERTICAL SUB MENU /////	

    jQuery('.vernav > ul li a, .vernav2 > ul li a').each(function() {
        var url = jQuery(this).attr('href');
        jQuery(this).click(function() {
            if (jQuery(url).length > 0) {
                if (jQuery(url).is(':visible')) {
                    if (!jQuery(this).parents('div').hasClass('menucoll') &&
					   !jQuery(this).parents('div').hasClass('menucoll2'))
                        jQuery(url).slideUp();
                } else {
                    jQuery('.vernav ul ul, .vernav2 ul ul').each(function() {
                        jQuery(this).slideUp();
                    });
                    if (!jQuery(this).parents('div').hasClass('menucoll') &&
					   !jQuery(this).parents('div').hasClass('menucoll2'))
                        jQuery(url).slideDown();
                }
                return false;
            }
        });
    });

    ///// ON LOAD WINDOW /////
    function reposSearch() {
        if (jQuery(window).width() < 520) {
            if (jQuery('.searchinner').length == 0) {
                jQuery('.search').wrapInner('<div class="searchinner"></div>');
                jQuery('<a class="searchicon"></a>').insertBefore(jQuery('.searchinner'));
                jQuery('<a class="searchcancel"></a>').insertAfter(jQuery('.searchinner button'));
            }
        } else {
            if (jQuery('.searchinner').length > 0) {
                jQuery('.search form').unwrap();
                jQuery('.searchicon, .searchcancel').remove();
            }
        }
    }
    reposSearch();
    ///// COLLAPSED/EXPAND LEFT MENU /////
    jQuery('.togglemenu').click(function() {
        if (!jQuery(this).hasClass('togglemenu_collapsed')) {
            $("#SelectDiv").hide();
            $('#allmap').width(($('#allmap').width() + 175));
            //if(jQuery('.iconmenu').hasClass('vernav')) {
            if (jQuery('.vernav').length > 0) {
                if (jQuery('.vernav').hasClass('iconmenu')) {
                    jQuery('.withvernav').addClass('withmenucoll');
                    jQuery('.iconmenu').addClass('menucoll');
                } else {
                    jQuery('.withvernav').addClass('withmenucoll');
                    jQuery('.vernav').addClass('menucoll').find('ul').hide();
                }
            } else if (jQuery('.vernav2').length > 0) {
                //} else {
                jQuery('.withvernav').addClass('withmenucoll2');
                jQuery('.iconmenu').addClass('menucoll2');
            }

            jQuery(this).addClass('togglemenu_collapsed');

            jQuery('.iconmenu > ul > li > a').each(function() {
                var label = jQuery(this).text();
                jQuery('<li><span>' + label + '</span></li>')
					.insertBefore(jQuery(this).parent().find('ul li:first-child'));
            });
        } else {
            $("#SelectDiv").show();
            $('#allmap').width(($('#allmap').width() - 175));
            //if(jQuery('.iconmenu').hasClass('vernav')) {
            if (jQuery('.vernav').length > 0) {
                if (jQuery('.vernav').hasClass('iconmenu')) {
                    jQuery('.withvernav').removeClass('withmenucoll');
                    jQuery('.iconmenu').removeClass('menucoll');
                } else {
                    jQuery('.withvernav').removeClass('withmenucoll');
                    jQuery('.vernav').removeClass('menucoll').find('ul').show();
                }
            } else if (jQuery('.vernav2').length > 0) {
                //} else {
                jQuery('.withvernav').removeClass('withmenucoll2');
                jQuery('.iconmenu').removeClass('menucoll2');
            }
            jQuery(this).removeClass('');

            jQuery('.iconmenu ul ul li:first-child').remove();
        }
    });


    $(window).resize(function() {
        ///// RESPONSIVE /////
        if (jQuery(document).width() < 640) {
            if (!jQuery(".togglemenu").hasClass('togglemenu_collapsed')) {
                jQuery('.togglemenu').trigger("click");
            }
        }
    });



    ///// ON RESIZE WINDOW /////
    jQuery(window).resize(function() {

        if (jQuery(window).width() > 640)
            jQuery('.centercontent').removeAttr('style');

        reposSearch();

    });


    ///// CHANGE THEME /////
    jQuery('.changetheme a').click(function() {
        var c = jQuery(this).attr('class');
        if (jQuery('#addonstyle').length == 0) {
            if (c != 'default') {
            //2016-01-04改为js 且重复写法 原因为兼容ie8 动态加载css by赵文龙
                var link = document.createElement('link');
                link.setAttribute('charset', 'gb2312');
                link.setAttribute('rel', 'stylesheet');
                link.setAttribute('type', 'text/css');
                link.id = "addonstyle";
                link.setAttribute('href', "/App_Themes/Platform/themes/"+c+"/style." + c + ".css");

                var link2 = document.createElement('link');
                link2.setAttribute('charset', 'gb2312');
                link2.setAttribute('rel', 'stylesheet');
                link2.setAttribute('type', 'text/css');
                link2.id = "addonstyle";
                link2.setAttribute('href', "/App_Themes/Platform/themes/" + c + "/style." + c + ".css");

                var link3 = document.createElement('link');
                link3.setAttribute('charset', 'gb2312');
                link3.setAttribute('rel', 'stylesheet');
                link3.setAttribute('type', 'text/css');
                link3.id = "addonstyle";
                link3.setAttribute('href', "/App_Themes/Platform/themes/" + c + "/style." + c + ".css");
                document.body.appendChild(link);
                //jQuery('head').append('<link charset="gb2312" id="addonstyle" rel="stylesheet" href="/App_Themes/Platform/css/style.' + c + '.css" type="text/css" />');
                //jQuery(window.frames["MainFrame"].document.head).append('<link charset="gb2312" id="addonstyle" rel="stylesheet" href="/App_Themes/Platform/css/style.' + c + '.css" type="text/css" />');
                window.frames["MainFrame"].document.body.appendChild(link2);
                //jQuery(window.frames["MainFrame"].document.getElementById('LeftFrame').contentWindow.document.head).append('<link charset="gb2312" id="addonstyle" rel="stylesheet" href="/App_Themes/Platform/css/style.' + c + '.css" type="text/css" />');
                window.frames["MainFrame"].document.getElementById('LeftFrame').contentWindow.document.body.appendChild(link3);
                jQuery.cookie("addonstyle", c, { path: '/', expires: 36500 });
            }
        } else {
            if (c != 'default') {
                jQuery('#addonstyle').attr('href', '/App_Themes/Platform/themes/'+c+'/style.' + c + '.css');

                jQuery(window.frames["MainFrame"].document).find("#addonstyle").attr('href', '/App_Themes/Platform/themes/'+c+'/style.' + c + '.css');

                jQuery(window.frames["MainFrame"].document.getElementById('LeftFrame').contentWindow.document).find("#addonstyle").attr('href', '/App_Themes/Platform/themes/'+c+'/style.' + c + '.css');

                jQuery.cookie("addonstyle", c, { path: '/', expires: 36500 });
            } else {
                jQuery('#addonstyle').remove();
                jQuery(window.frames["MainFrame"].document).find("#addonstyle").remove();
                jQuery(window.frames["MainFrame"].document.getElementById('LeftFrame').contentWindow.document).find("#addonstyle").remove();
                jQuery.cookie("addonstyle", null);
            }
        }
    });

    ///// LOAD ADDON STYLE WHEN IT'S ALREADY SET /////
    if (jQuery.cookie('addonstyle')) {
        var c = jQuery.cookie('addonstyle');
        if (c != ''&&c!="default") {
            var link = document.createElement('link');
            link.setAttribute('charset', 'gb2312');
            link.setAttribute('rel', 'stylesheet');
            link.setAttribute('type', 'text/css');
            link.id = "addonstyle";
            link.setAttribute('href', "/App_Themes/Platform/themes/" + c + "/style." + c + ".css");
            document.body.appendChild(link);
            //jQuery('head').append('<link id="addonstyle" charset="gb2312" rel="stylesheet" href="/App_Themes/Platform/css/style.' + c + '.css" type="text/css" />');
            jQuery.cookie("addonstyle", c, { path: '/', expires: 36500 });
        }
    }

})
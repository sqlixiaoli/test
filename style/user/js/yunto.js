(function ($) {
    $.getUrlParam = function (name, url) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (url != null) {
            var _url = url.split("?")[1];
            r = _url.match(reg);
        }
        if (r != null) return unescape(r[2]); return null;
    }
})(jQuery);
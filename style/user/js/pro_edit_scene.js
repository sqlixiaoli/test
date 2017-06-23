var kp = {};

(function () {
    kp.hotspot = {};
    kp.hotspot.set = function (name, atc, val) {
        panobj.contentWindow.getkp().set("hotspot['" + name + "']." + atc, val);
    }

    kp.hotspot.get = function (name, atc) {
        return panobj.contentWindow.getkp().get("hotspot['" + name + "']." + atc);
    }    
    
    $(["visible", "ath", "atv", "rotate", "zoom", "scale", "url", "handcursor", "alpha", "autoalpha", "onloaded", "ondown", "onclick", "rotatewithview", "distorted"]).each(function (i, el) {
        kp.hotspot[el] = function (name,val) {
            if (val == null)
            { return kp.hotspot.get(name, el) }
            else
            { kp.hotspot.set(name, el, val); }
        }
    });

    kp.hotspot.add = function (name, url, ath, atv, title)
    {
        panobj.contentWindow.getkp().call("add_hotspot('" + name + "', '" + ath + "','" + atv + "', '" + title + "','" + url + "')");          
    }


    //加重显示某一个锚点
    kp.hotspot.aggravated = function (hotspot_list,name)
    {
        if (name == null)
        {
            $.each(hotspot_list, function (i, skey) {
                kp.hotspot.alpha(skey, 1);
            });
        }
        else
        {
            $.each(hotspot_list, function (i, skey) {
                kp.hotspot.autoalpha(skey, true);
                kp.hotspot.alpha(skey, "0.3");
            });

            kp.hotspot.autoalpha(name, true);
            kp.hotspot.alpha(name, "1");
        }
    }

    //添加或取消Ondown事件
    kp.hotspot.editondown = function (hotspot_list, evename) {
        if (evename == null) {
            $.each(hotspot_list, function (i, skey) {
                kp.hotspot.ondown(skey, "");
            });
        }
        else {
            $.each(hotspot_list, function (i, skey) {
                kp.hotspot.ondown(skey, evename);
            });
        }
    }

    //添加或取消OnClick事件
    kp.hotspot.editonclick = function (hotspot_list, evename) {
        if (evename == null) {
            $.each(hotspot_list, function (i, skey) {
                kp.hotspot.onclick(skey, "");
            });
        }
        else {
            $.each(hotspot_list, function (i, skey) {
                kp.hotspot.onclick(skey, evename);
            });
        }
    }


    //添加或取消可点击状态
    kp.hotspot.edithandcursor = function (hotspot_list, handstatus, name) {
        $.each(hotspot_list, function (i, skey) {
            kp.hotspot.handcursor(skey, handstatus);
        });
        if (name != null) {
            kp.hotspot.handcursor(name, !handstatus);
        }      
    }

    kp.hotspot.title = function (_name, _title) {
        if (_title == null)
        {
            panobj.contentWindow.getkp().set("plugin['tooltip_" + _name + "'].visible", false);
        }
        else
        {
            panobj.contentWindow.getkp().set("plugin['tooltip_" + _name + "'].html", _title);
            panobj.contentWindow.getkp().set("plugin['tooltip_" + _name + "'].visible", true);
        }
    }

    kp.hotspot.gettitle = function (_name) {
        var _title = panobj.contentWindow.getkp().get("plugin['tooltip_" + _name + "'].html");
        if (_title == null) _title = "";
        if (_title == "null") _title = "";
        return _title;
    }

})();
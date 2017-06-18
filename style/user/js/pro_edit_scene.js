var kp = {};

(function () {
    kp.hotspot = {};
    kp.hotspot.set = function (name, atc, val) {
        panobj.contentWindow.getkp().set("hotspot['" + name + "']." + atc, val);
    }

    kp.hotspot.get = function (name, atc) {
        return panobj.contentWindow.getkp().get("hotspot['" + name + "']." + atc);
    }    
    
    $(["visible", "ath", "atv", "rotate", "zoom", "scale", "url", "handcursor", "alpha", "autoalpha","handcursor"]).each(function (i, el) {
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

})();
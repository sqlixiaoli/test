var kp = {};

(function () {
    kp.hotspot = {};
    kp.hotspot.set = function (name, atc, val) {
        panobj.contentWindow.getkp().set("hotspot['" + name + "']." + atc, val);
    }

    kp.hotspot.get = function (name, atc) {
        return panobj.contentWindow.getkp().get("hotspot['" + name + "']." + atc);
    }    

    $(["visible", "ath", "atv", "rotate", "zoom", "scale", "url", "handcursor"]).each(function (i, el) {
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

})();
function js_scene_now_address(h, v, f) {
    self.parent.pan_scene_now_address(h, v, f);    
}

function js_scene_add_hotspot(_name, h, v, _title)
{
    mykp.call("add_hotspot('" + _name + "', '" + h + "','" + v + "', '" + _title + "')");
}

function js_scene_hotspot_status(_name,h,v)
{
    self.parent.pan_scene_hotspot_status(_name, h, v, mykp);
}

function getkp()
{
    return mykp;
}
﻿//回调当前位置
function js_scene_now_address(h, v, f) {
    self.parent.pan_scene_now_address(h, v, f);    
}

//回调当前hotspot信息
function js_scene_hotspot_status(_name)
{
    self.parent.pan_scene_hotspot_status(_name);
}

//获取当前kp对像
function getkp()
{
    return mykp;
}
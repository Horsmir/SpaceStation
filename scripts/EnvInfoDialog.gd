extends Control

var im_o2 = 0.0
var im_co2 = 0.0
var im_temp = 0.0
var im_humid = 0.0
var im_press = 0.0

var om_o2 = 0.0
var om_co2 = 0.0
var om_temp = 0.0
var om_humid = 0.0
var om_press = 0.0

var ov_o2 = 0.0
var ov_co2 = 0.0
var ov_temp = 0.0
var ov_humid = 0.0
var ov_press = 0.0

var up_leak = '⬆'
var down_leak = '⬇'
var zero_leak = '↔'

onready var o2_label_im = $TabContainer/IntoModule/ParamPanel/HBoxContainer/O2Perc
onready var o2_leak_im = $TabContainer/IntoModule/ParamPanel/HBoxContainer/O2Dyn
onready var co2_label_im = $TabContainer/IntoModule/ParamPanel/HBoxContainer2/CO2Perc
onready var co2_leak_im = $TabContainer/IntoModule/ParamPanel/HBoxContainer2/CO2Dyn
onready var temp_label_im = $TabContainer/IntoModule/ParamPanel/HBoxContainer3/Temp
onready var temp_leak_im = $TabContainer/IntoModule/ParamPanel/HBoxContainer3/TempDyn
onready var humid_label_im = $TabContainer/IntoModule/ParamPanel/HBoxContainer4/Humid
onready var humid_leak_im = $TabContainer/IntoModule/ParamPanel/HBoxContainer4/HumidDyn
onready var press_label_im = $TabContainer/IntoModule/ParamPanel/HBoxContainer5/Pressure
onready var press_leak_im = $TabContainer/IntoModule/ParamPanel/HBoxContainer5/PressureDyn

onready var o2_label_om = $TabContainer/OutModule/ParamPanel/HBoxContainer/O2Perc
onready var o2_leak_om = $TabContainer/OutModule/ParamPanel/HBoxContainer/O2Dyn
onready var co2_label_om = $TabContainer/OutModule/ParamPanel/HBoxContainer2/CO2Perc
onready var co2_leak_om = $TabContainer/OutModule/ParamPanel/HBoxContainer2/CO2Dyn
onready var temp_label_om = $TabContainer/OutModule/ParamPanel/HBoxContainer3/Temp
onready var temp_leak_om = $TabContainer/OutModule/ParamPanel/HBoxContainer3/TempDyn
onready var humid_label_om = $TabContainer/OutModule/ParamPanel/HBoxContainer4/Humid
onready var humid_leak_om = $TabContainer/OutModule/ParamPanel/HBoxContainer4/HumidDyn
onready var press_label_om = $TabContainer/OutModule/ParamPanel/HBoxContainer5/Pressure
onready var press_leak_om = $TabContainer/OutModule/ParamPanel/HBoxContainer5/PressureDyn

onready var o2_label_ov = $TabContainer/Overboard/ParamPanel/HBoxContainer/O2Perc
onready var o2_leak_ov = $TabContainer/Overboard/ParamPanel/HBoxContainer/O2Dyn
onready var co2_label_ov = $TabContainer/Overboard/ParamPanel/HBoxContainer2/CO2Perc
onready var co2_leak_ov = $TabContainer/Overboard/ParamPanel/HBoxContainer2/CO2Dyn
onready var temp_label_ov = $TabContainer/Overboard/ParamPanel/HBoxContainer3/Temp
onready var temp_leak_ov = $TabContainer/Overboard/ParamPanel/HBoxContainer3/TempDyn
onready var humid_label_ov = $TabContainer/Overboard/ParamPanel/HBoxContainer4/Humid
onready var humid_leak_ov = $TabContainer/Overboard/ParamPanel/HBoxContainer4/HumidDyn
onready var press_label_ov = $TabContainer/Overboard/ParamPanel/HBoxContainer5/Pressure
onready var press_leak_ov = $TabContainer/Overboard/ParamPanel/HBoxContainer5/PressureDyn

onready var into_param_panel = $TabContainer/IntoModule/ParamPanel
onready var out_param_panel = $TabContainer/OutModule/ParamPanel
onready var ov_param_panel = $TabContainer/Overboard/ParamPanel

onready var into_error_panel = $TabContainer/IntoModule/ErrorPanel
onready var out_error_panel = $TabContainer/OutModule/ErrorPanel
onready var ov_error_panel = $TabContainer/Overboard/ErrorPanel


func set_parameters(into_module=null, out_module=null, overboard=null):
    if into_module:
        into_param_panel.show()
        into_error_panel.hide()
        o2_label_im.set_text(str(into_module['o2_per']))
        set_leak_symbol(o2_leak_im, into_module['o2_leak'])
        co2_label_im.set_text(str(into_module['co2_per']))
        set_leak_symbol(co2_leak_im, into_module['co2_leak'])
        temp_label_im.set_text(str(into_module['temp']))
        set_leak_symbol(temp_leak_im, into_module['temp_leak'])
        humid_label_im.set_text(str(into_module['humid']))
        set_leak_symbol(humid_leak_im, into_module['humid_leak'])
        press_label_im.set_text(str(into_module['press']))
        set_leak_symbol(press_leak_im, into_module['press_leak'])
    else:
        into_param_panel.hide()
        into_error_panel.show()

    if out_module:
        out_param_panel.show()
        out_error_panel.hide()
        o2_label_om.set_text(str(out_module['o2_per']))
        set_leak_symbol(o2_leak_om, out_module['o2_leak'])
        co2_label_om.set_text(str(out_module['co2_per']))
        set_leak_symbol(co2_leak_om, out_module['co2_leak'])
        temp_label_om.set_text(str(out_module['temp']))
        set_leak_symbol(temp_leak_om, out_module['temp_leak'])
        humid_label_om.set_text(str(out_module['humid']))
        set_leak_symbol(humid_leak_om, out_module['humid_leak'])
        press_label_om.set_text(str(out_module['press']))
        set_leak_symbol(press_leak_om, out_module['press_leak'])
    else:
        out_param_panel.hide()
        out_error_panel.show()

    if overboard:
        ov_param_panel.show()
        ov_error_panel.hide()
        o2_label_ov.set_text(str(overboard['o2_per']))
        set_leak_symbol(o2_leak_ov, overboard['o2_leak'])
        co2_label_ov.set_text(str(overboard['co2_per']))
        set_leak_symbol(co2_leak_ov, overboard['co2_leak'])
        temp_label_ov.set_text(str(overboard['temp']))
        set_leak_symbol(temp_leak_ov, overboard['temp_leak'])
        humid_label_ov.set_text(str(overboard['humid']))
        set_leak_symbol(humid_leak_ov, overboard['humid_leak'])
        press_label_ov.set_text(str(overboard['press']))
        set_leak_symbol(press_leak_ov, overboard['press_leak'])
    else:
        ov_param_panel.hide()
        ov_error_panel.show()


func set_leak_symbol(label, value):
    if value > 0:
        label.set_text(up_leak)
    elif value < 0:
        label.set_text(down_leak)
    else:
        label.set_text(zero_leak)


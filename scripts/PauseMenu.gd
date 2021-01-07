extends Control


onready var proceed_button = $Panel/MarginContainer/VBoxContainer/ProccedButton


func _ready():
    var esc = ShortCut.new()
    esc.shortcut = InputMap.get_action_list('ui_cancel')[0]
    proceed_button.shortcut = esc


func _on_ProccedButton_pressed():
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
    get_tree().paused = false
    hide()


func _on_MainMenuButton_pressed():
    pass # Replace with function body.


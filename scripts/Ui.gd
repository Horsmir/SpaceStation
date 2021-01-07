extends Control


onready var inventory_control = $InventoryControl
onready var hud = $Hud


func _on_InteractionRayCast_on_get_item():
    inventory_control.set_list()


func out_pause():
    inventory_control.hide()
    hud.show()
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)




func _on_EnvInfoDialog_popup_hide():
    get_tree().paused = false
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

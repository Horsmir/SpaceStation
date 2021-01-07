extends Interactable


export (NodePath) var player
export (String) var into_module
export (String) var out_module
export (String) var overboard

onready var dialog_node = get_node(player).get_node('Ui/EnvInfoDialog')


func get_interaction_text():
    return 'Show Info Window'


func interact():
    var into_data = EnvData.get_data(into_module)
    var out_data = EnvData.get_data(out_module)
    var over_data = EnvData.get_data(overboard)
    dialog_node.set_parameters(into_data, out_data, over_data)
    dialog_node.popup()
    Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
    get_tree().paused = true


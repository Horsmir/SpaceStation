extends Interactable


export var door : NodePath

onready var door_node = get_node(door)

var on = true


func _ready():
    if door_node.state == 'closed':
        on = true
    else:
        on = false


func get_interaction_text():
    return 'Open the door' if on else 'Close the door'


func interact():
    $AnimationPlayer.play('click')
    door_node.anim_door()
    on = !on


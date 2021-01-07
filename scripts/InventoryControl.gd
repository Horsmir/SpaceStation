extends Control


export (PackedScene) var slot_scene = null

onready var grid = $Panel/Grid


func _ready():
    set_list()

func set_list():
    clear()
    for inv_item in P.all:
        var s = slot_scene.instance()
        var item = P.all[inv_item]
        s.icon = item['icon']
        s.count = item['count']
        grid.add_child(s)


func clear():
    for item in grid.get_children():
        item.queue_free()



func _on_CloseButton_pressed():
    get_tree().paused = false
    get_parent().out_pause()


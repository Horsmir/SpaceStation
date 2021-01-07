extends Panel


var icon = '' setget set_icon, get_icon_path
var count = 0 setget set_count, get_count


func set_icon(icon_name):
    icon = icon_name
    $Icon.texture = load(icon)


func get_icon_path():
    return icon


func set_count(c):
    count = c
    $Amount.set_text(str(count))


func get_count():
    return count


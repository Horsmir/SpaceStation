extends Node

class_name Interactable


export var remove_item = false
export var pack = {'key': '', 'label': '', 'disc': '', 'count': 1, 'icon': '',}


func get_interaction_text():
    return 'get the %s' % [pack['label']]


func interact():
    if remove_item:
        P.add(pack['key'], pack['label'], pack['disc'], pack['count'], pack['icon'])
        queue_free()


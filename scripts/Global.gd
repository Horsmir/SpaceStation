extends Node


var current_module = '' setget set_current_module, get_current_module


# Called when the node enters the scene tree for the first time.
func _ready():
    pass


# Set current module
func set_current_module(module_id):
    current_module = module_id


func get_current_module():
    return current_module


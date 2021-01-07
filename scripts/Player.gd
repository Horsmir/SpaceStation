extends KinematicBody


export var speed = 10
export var acceleration = 5
export var gravity = 0.98
export var jump_power = 30
export var mouse_sensitivity = 0.3

onready var head = $Head
onready var camera = $Head/Camera

var velosity = Vector3.ZERO
var camera_rotation = 0


func _ready():
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event):
    if event is InputEventMouseMotion:
        head.rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))

        var x_delta = event.relative.y * mouse_sensitivity
        if camera_rotation + x_delta > -90 and camera_rotation + x_delta < 90:
            camera.rotate_x(deg2rad(-x_delta))
            camera_rotation += x_delta


func _physics_process(delta):
    
    
    var head_basis = head.get_global_transform().basis

    var direction = Vector3()
    if Input.is_action_pressed('move_forward'):
        direction -= head_basis.z
    elif Input.is_action_pressed('move_backward'):
        direction += head_basis.z

    if Input.is_action_pressed('move_left'):
        direction -= head_basis.x
    elif Input.is_action_pressed('move_right'):
        direction += head_basis.x

    direction = direction.normalized()
    
    velosity = velosity.linear_interpolate(direction * speed, acceleration * delta)
    velosity.y -= gravity

    if Input.is_action_just_pressed('jump') and is_on_floor():
        velosity.y += jump_power

    if Input.is_action_just_pressed('inventory'):
        $Ui/InventoryControl.show()
        $Ui/Hud.hide()
        Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
        get_tree().paused = true

    velosity = move_and_slide(velosity, Vector3.UP)


func _process(delta):
    if Input.is_action_just_pressed('ui_cancel'):
        if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
            Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
            get_tree().paused = false
        else:
            Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
            get_tree().paused = true
            $Ui/PauseMenu.show()

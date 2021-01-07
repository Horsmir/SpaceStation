extends StaticBody


onready var anim = $AnimationPlayer
var state = 'closed'


func anim_door():
    if state == 'closed':
        anim.play('open')
        state = 'opened'
    elif state == 'opened':
        anim.play_backwards('open')
        state = 'closed'


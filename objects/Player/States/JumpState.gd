class_name PlayerJumpState
extends PlayerState

var MoveSpeed = 250.0
var JumpHeight = -550.0

func EnterState():
	parent.sprite.play("Jump")
	parent.velocity.y = JumpHeight

func ExitState():
	pass

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	if parent.is_on_floor():
		Transitioned.emit("PlayerIdleState")

	var playerdir = Input.get_axis("move_left","move_right")
	
	if playerdir < 0:
		parent.sprite.flip_h = true
	elif playerdir > 0:
		parent.sprite.flip_h = false
	
	parent.velocity.x = playerdir * MoveSpeed

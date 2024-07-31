class_name PlayerWalkState
extends PlayerState

# Movement State

const WALKSPEED := 200.0

var MoveSpeed
var playerdir : float

func EnterState():
	parent.sprite.play("Run")
	MoveSpeed = WALKSPEED

func ExitState():
	parent.velocity.x = 0

func Physics_Update(_delta: float):
	playerdir = Input.get_axis("move_left","move_right")
	
	if playerdir < 0:
		parent.sprite.flip_h = true
	elif playerdir > 0:
		parent.sprite.flip_h = false
	
	parent.velocity.x = playerdir * MoveSpeed
	
	JumpInput()
	CheckStateConditions()
	
func CheckStateConditions():
	if playerdir == 0:
		Transitioned.emit("PlayerIdleState")
		
func JumpInput():
	if Input.is_action_just_pressed("jump"):
		Transitioned.emit("PlayerJumpState")

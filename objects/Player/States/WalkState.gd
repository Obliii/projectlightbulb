class_name PlayerWalkState
extends PlayerState

# Movement State

const WALKSPEED := 325.0

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
	
	CheckStateConditions()

# Check the many different things the player could do while moving.	
func CheckStateConditions():
	if playerdir == 0:
		Transitioned.emit("PlayerIdleState")
		
	if Input.is_action_just_pressed("shoot"):
		Transitioned.emit("PlayerShootState")
		
	if Input.is_action_just_pressed("jump"):
		Transitioned.emit("PlayerJumpState")


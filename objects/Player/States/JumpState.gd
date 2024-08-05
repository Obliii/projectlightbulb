class_name PlayerJumpState
extends PlayerState

var MoveSpeed = 300.0
var JumpHeight = -600.0

var DoubleJumped : bool = false

func EnterState():
	parent.sprite.play("Jump")
	parent.velocity.y = JumpHeight

func ExitState():
	parent.velocity.x = 0
	DoubleJumped = false

func Physics_Update(_delta: float):
	# If the player touches the floor then they will be in the idle state.
	if parent.is_on_floor():
		Transitioned.emit("PlayerIdleState")
		
	if Input.is_action_just_pressed("shoot"):
		Transitioned.emit("PlayerShootState")
	
	# Double Jumping
	if Input.is_action_just_pressed("jump") and !DoubleJumped:
		DoubleJumped = true
		parent.velocity.y = JumpHeight
	
	# Same as the Move State but the player moves slightly slower while they are jumping.
	var playerdir = Input.get_axis("move_left","move_right")
	
	if playerdir < 0:
		parent.sprite.flip_h = true
	elif playerdir > 0:
		parent.sprite.flip_h = false
	
	parent.velocity.x = playerdir * MoveSpeed

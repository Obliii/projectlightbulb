class_name PlayerIdleState
extends PlayerState

func EnterState():
	parent.sprite.play("Idle")

# Idle state will be the state where all states will be determined.

func Physics_Update(_delta: float):
	# Shoot Light!
	#if Input.is_action_just_pressed("Submit"):
		#Transitioned.emit("PlayerShootLight")
	
	# MOVEMENT STATE
	if Input.get_axis("move_left", "move_right"):
		Transitioned.emit("PlayerWalkState")
		
	JumpInput()
		
func JumpInput():
	if Input.is_action_just_pressed("jump"):
		Transitioned.emit("PlayerJumpState")

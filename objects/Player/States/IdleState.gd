class_name PlayerIdleState
extends PlayerState

func EnterState():
	parent.sprite.play("Idle")

func Physics_Update(_delta: float):
	CheckStateConditions()
		
		
func CheckStateConditions():
	# MOVEMENT STATE
	if Input.get_axis("move_left", "move_right"):
		Transitioned.emit("PlayerWalkState")	

	# JUMP STATE
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		Transitioned.emit("PlayerJumpState")

	# SHOOT STATE
	if Input.is_action_just_pressed("shoot"):
		Transitioned.emit("PlayerShootState")

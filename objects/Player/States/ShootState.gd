class_name PlayerShootState
extends PlayerState

@onready var Pew = $"../../AudioStreamPlayer2D"
var AnimationTime : float = 0.0
var EndTime : float = 0.33

func EnterState():
	parent.sprite.play("StaffUse")
	parent.fire_projectile()
	Pew.playing = true

func ExitState():
	parent.velocity.x = 0
	AnimationTime = 0.0

func Update(_delta: float):
	AnimationTime += _delta
	
	if AnimationTime > EndTime:
		Transitioned.emit("PlayerIdleState")

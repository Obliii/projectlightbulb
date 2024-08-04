class_name PlayerShootState
extends PlayerState

var AnimationTime : float = 0.0
var EndTime : float = 100.0

func EnterState():
	parent.sprite.play("StaffUse")

func ExitState():
	AnimationTime = 0.0

func Update(_delta: float):
	AnimationTime += _delta
	
	if AnimationTime > EndTime:
		Transitioned.emit("PlayerIdleState")

extends AnimatableBody2D

var is_active : bool

# Called when the node enters the scene tree for the first time.
func activate(active):
	is_active = active
	
	if active:
		$AnimationPlayer.play("moveup")
		print("MOVINGGGGGG UP")
	else:
		$AnimationPlayer.play_backwards("moveup")
		print("MOVINGGGGGG DOWN")

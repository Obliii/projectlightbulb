extends Area2D

enum MirrorDirections{
	Mirror_Up,
	Mirror_Down,
	Mirror_Right,
	Mirror_Left,
	Mirror_Count
}

## Mirror Variables
@export var mirrordirection : MirrorDirections = MirrorDirections.Mirror_Left
var mirror

## Player Variables
var PlayerEntered : bool = false

func _ready():
	mirror = $AnimatedSprite2D
	UpdateMirror()

func _process(delta):
	input_event()

func TurnMirror():
	match mirrordirection:
		MirrorDirections.Mirror_Up:
			mirrordirection = MirrorDirections.Mirror_Left
			pass
		MirrorDirections.Mirror_Left:
			mirrordirection = MirrorDirections.Mirror_Down
			pass
		MirrorDirections.Mirror_Down:
			mirrordirection = MirrorDirections.Mirror_Right
			pass
		MirrorDirections.Mirror_Right:
			mirrordirection = MirrorDirections.Mirror_Up
			pass
				
	UpdateMirror()

func input_event():
	if Input.is_action_just_pressed("activate") and PlayerEntered:
		TurnMirror()

func UpdateMirror():
	match mirrordirection:
			MirrorDirections.Mirror_Up:
				mirror.play("MirrorAngled-Up")
				mirror.flip_h = true
				mirror.flip_v = true
			MirrorDirections.Mirror_Left:
				mirror.play("MirrorLeft")
				mirror.flip_h = false
				mirror.flip_v = false
			MirrorDirections.Mirror_Down:
				mirror.play("MirrorAngled-Up")
				mirror.flip_h = false
				mirror.flip_v = true
			MirrorDirections.Mirror_Right:
				mirror.play("MirrorLeft")
				mirror.flip_h = true
				mirror.flip_v = false
				

# Player entering in so they can change the mirror direction.
func _on_body_entered(body):
	if body.is_in_group("Player"):
		PlayerEntered = true
func _on_body_exited(body):
	if body.is_in_group("Player"):
		PlayerEntered = false

# Editting while ingame.

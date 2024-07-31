class_name ScrollCamera
extends Camera2D

## For the Camera to be able to follow the Player.
@export var Player: CharacterBody2D
var max_distance = 500.0

func check_player_position():
	if Player.position.distance_to(self.position) > max_distance:
		set_new_position()

func set_new_position():
	self.position.x = Player.position.x
	
# Move Camera if Player is too far.
func _physics_process(delta):
	check_player_position()


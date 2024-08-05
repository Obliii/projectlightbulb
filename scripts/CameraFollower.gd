class_name ScrollCamera
extends Camera2D

@export var target_zoom: Vector2 = self.zoom
@export var zoom_smoothness: float = 0.1

@export var PlayerCharacter : Player
@export var follow_player : bool = true

func _set_new_position(NewCameraPos : Vector2, NewCameraZoom : Vector2, FollowPlayer: bool):	
	# Use GODOT's Position Smoothing to position the camera.
	# Set the camera's target zoom so that the process could do the rest.
	position = NewCameraPos
	target_zoom = NewCameraZoom
	follow_player = FollowPlayer

func _process(delta):
	zoom = lerp(zoom, target_zoom, zoom_smoothness * delta)
	
	if follow_player:
		self.position.x = PlayerCharacter.position.x

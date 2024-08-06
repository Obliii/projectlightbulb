class_name ScrollCamera
extends Camera2D

@export var target_zoom: Vector2 = self.zoom
@export var zoom_smoothness: float = 0.1

@export var PlayerCharacter : Player
@export var follow_playerX : bool = true
@export var follow_playerY : bool = true

func _ready():
	GameManager.ChangeCameraPos.connect(_set_new_position)

func _set_new_position(NewCameraPos: Vector2, NewCameraZoom: Vector2, FollowPlayerX: bool, FollowPlayerY: bool):	
	# Use GODOT's Position Smoothing to position the camera.
	# Set the camera's target zoom so that the process could do the rest.
	position = NewCameraPos
	target_zoom = NewCameraZoom
	follow_playerX = FollowPlayerX
	follow_playerY = FollowPlayerY

func _process(delta):
	zoom = lerp(zoom, target_zoom, zoom_smoothness * delta)
	
func _physics_process(delta):
	if follow_playerX:
		self.global_position.x = PlayerCharacter.global_position.x
	if follow_playerY:
		self.global_position.y = PlayerCharacter.global_position.y

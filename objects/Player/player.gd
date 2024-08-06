class_name Player
extends CharacterBody2D

@export var sprite : AnimatedSprite2D
@export var entity : CharacterBody2D
@export var raycast_collider : RayCast2D
@export var raycast_above : RayCast2D
@export var ShotMarker : Marker2D

# I want the character's direction -1 (left), 1 (right)
@export var characterdirection: int = 1
@export var projectile_scene: PackedScene

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func GetDirection():
	# Just to get the real direction of the player. I'll figure out a better way next time. haha. TIME CRUNCH.
	var dir = Input.get_axis("move_left","move_right")
	
	if dir != 0:
		characterdirection = dir

func fire_projectile():
	var lightinstance = projectile_scene.instantiate()
	
	lightinstance.position = ShotMarker.position
	lightinstance.position.x = ShotMarker.position.x + (characterdirection * 40)
	
	lightinstance.setdirection(Vector2(characterdirection,0))
	print(lightinstance.position)
	
	get_tree().root.add_child(lightinstance)
		
func _physics_process(delta):
	# Since the ShotMarker doesn't want to act right, I'm setting it manually........... ugh. this took way too long. AND IT WAS THIS SIMPLE????
	ShotMarker.position = Vector2(position.x, position.y - 60)
	
	if !is_on_floor():
		velocity.y += gravity * delta
	
	move_and_slide()

class_name Player
extends CharacterBody2D

@export var sprite : AnimatedSprite2D
@export var entity : CharacterBody2D
@export var raycast_collider : RayCast2D
@export var raycast_above : RayCast2D
@export var ShotMarker : Marker2D

# I want the character's direction -1 (left), 1 (right)
@export var characterdirection: int = 1

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var lightprojectile = preload("res://objects/LightProjectile/LightProjectile.tscn")

func _ready():
	var lightinstance = lightprojectile
	
	lightinstance.position = position
	lightinstance.position.x = position.x * characterdirection
	
	
	
func _physics_process(delta):
	# TODO: Put Gravity into it's own state?
	if !is_on_floor():
		velocity.y += gravity * delta
	
	move_and_slide()

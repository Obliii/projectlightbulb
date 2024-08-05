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
	
func fire_projectile():
	var lightinstance = lightprojectile.instance()
	
	lightinstance.position = ShotMarker.position
	lightinstance.position.x = ShotMarker.position.x * characterdirection
	
	lightinstance.setdirection(characterdirection)
	
	get_tree().root.add_child(lightinstance)
		
func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity * delta
	
	move_and_slide()

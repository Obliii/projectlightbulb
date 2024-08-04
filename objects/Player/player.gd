class_name Player
extends CharacterBody2D

@export var sprite : AnimatedSprite2D
@export var entity : CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Everything else is running on the PlayerStateMachine and its states.
	
func _physics_process(delta):
	# TODO: Put Gravity into it's own state?
	if !is_on_floor():
		velocity.y += gravity * delta
	
	move_and_slide()

#Obli: Commenting this out for the time being while I test everything.

#func _on_area_2d_body_entered(body):
#	if body.is_in_group("Rigidbody"):
#		body.collision_layer = 1
#		body.collision_mask = 1


#func _on_area_2d_body_exited(body):
#	if body.is_in_group("Rigidbody"):
#		body.collision_layer = 2
#		body.collision_mask = 2

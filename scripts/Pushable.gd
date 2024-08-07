extends CharacterBody2D

var push = true
var direction = 0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):

	if not is_on_floor():
		velocity.y += gravity * delta
	
	if push:
		velocity.x = direction * delta * 500
	else:
		velocity.x = 0
	move_and_slide()



func _on_left_body_entered(body):
	if body.is_in_group("Player"):
		direction = 1
		push = true


func _on_left_body_exited(body):
	if body.is_in_group("Player"):
		direction = 0
		push = false


func _on_right_body_entered(body):
	if body.is_in_group("Player"):
		direction = -1
		push = true


func _on_right_body_exited(body):
	if body.is_in_group("Player"):
		direction = 0
		push = false


func _on_up_body_entered(body):
	if body.is_in_group("Player"):
		direction = 0
		push = false
		 


func _on_up_body_exited(body):
	if body.is_in_group("Player"):
		direction = 0
		push = false

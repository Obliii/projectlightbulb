extends Node2D

@export var projectile_speed: float = 2.5
const WALL_LAYER = 3

var direction : Vector2

func _ready():
	# Delete useless projectiles.
	if !direction:
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x += direction.x * projectile_speed
	position.y += direction.y * projectile_speed
	

func setdirection(newdirection):
	direction = newdirection

# Object Collides with wall
func _on_area_2d_body_entered(body):
	if body.collision_layer & WALL_LAYER != 0:
		queue_free()

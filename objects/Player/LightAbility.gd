extends Area2D

@export var LightSpeed = 500

var LightDirection = Vector2.RIGHT 
var is_running = true

func _ready():
	start_movement()

func _process(delta):
	pass

func start_movement():
	is_running = true

func _move_light_beam():
	while is_running:
		var delta = 1 / Engine.get_process_frames()
		var motion = LightDirection * LightSpeed * delta
		var collision = get_world_2d().direct_space_state.intersect_ray(global_position + motion)
		
		if collision:
			var collider = collision.collider
			if collider.is_in_group("Mirror"):
				# Reflect the light beam.
				LightDirection = LightDirection.bounce(collision.normal)
				update_beam_length(collision.position)
			else:
				# Stops the light beam
				is_running = false
				update_beam_length(collision.position)
		else:
			global_position += motion
			update_beam_length(global_position + motion)
			
		# Loop is able to end.
		if not is_running:
			break

func update_beam_length(end_pos):
	var start_pos = global_position
	var length = start_pos.distance_to(end_pos)
	$AnimatedSprite2D.scale.x = length / $Sprite.texture.get_size().x
	$CollisionShape2D.shape.set_extents(Vector2(length / 2, $CollisionShape2D.shape.get_extents().y))

func _exit_tree():
	is_running = false

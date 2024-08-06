extends Node2D

@export var projectile_speed: float = 40
@export var lifetime: float
const WALL_LAYER = 3

# Projectile Lifetime
var CurrentLifetime: float
const MAX_LIGHTLIFETIME = 5.0
const TIMESPEED = 5.0

@export var direction : Vector2 = Vector2(1,0)

func _ready():
	# Delete useless projectiles.
	if !direction:
		queue_free()

func _process(delta):
	CurrentLifetime += TIMESPEED * delta
	if CurrentLifetime >= MAX_LIGHTLIFETIME:
		queue_free()

func _physics_process(delta):
	position += direction * projectile_speed
func setdirection(newdirection: Vector2):
	direction = newdirection

# Object Collides with wall
func _on_area_2d_body_entered(body):
	if !body.is_in_group("Player") and !body.is_in_group("Interactable"):
		queue_free()

func LightFade():
	$Sprite2D.modulate(lerpf(255,0,CurrentLifetime))

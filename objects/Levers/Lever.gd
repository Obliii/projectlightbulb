extends Node2D

@export var is_active: bool = false
@export var connected_objects: Array = []

func _ready():
	UpdateSprite()

func _On_Activate(viewport, event, shape_id):
	if Input.is_action_just_pressed("activate"): #TODO: Add light touching the lever to change things.
		on_lever_activated()

	#Interact with the lever.
func on_lever_activated():
	is_active = !is_active
	update_connected_objects()
	UpdateSprite()
	
func update_connected_objects():
	for obj in connected_objects:
		if obj.has_method("activate"):
			obj.activate(is_active)

func UpdateSprite():
	if is_active:
		$AnimatedSprite2D.animation("Active")
		return	
	
	$AnimatedSprite2D.animation("Inactive")

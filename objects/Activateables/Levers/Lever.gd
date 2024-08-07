extends Node2D

@export var is_active: bool = false
@export var connected_objects: Array = []
@export var PlayerInRange: bool = false

func _ready():
	UpdateSprite()
	
func _process(delta):
	if Input.is_action_just_pressed("activate") and PlayerInRange:
		on_lever_activated()

# Interact with the lever.
func on_lever_activated():
	is_active = !is_active
	UpdateSprite()
	update_connected_objects()

# Connects the lever to the objects that will be affected.	
func update_connected_objects():
	for obj in connected_objects:
		var node = get_node(obj)
		if node and node.has_method("activate"):
			node.call("activate", is_active)

# Updates the sprite to what the current state is.
func UpdateSprite():
	if is_active:
		$AnimatedSprite2D.play("Active")
		return	
	
	$AnimatedSprite2D.play("Inactive")


# Activate if light enters the lever's range. Also check if player is in lever range.
func _on_body_entered(body):
	if body.is_in_group("Player"):
		PlayerInRange = true

# Check to see if the player has left the area.
func _on_body_exited(body):
	if body.is_in_group("Player"):
		PlayerInRange = false



func _on_area_entered(area):
	print("Lever: Object Entered")
	print("Area groups: ", area.get_groups())
	
	if area.is_in_group("Light"):
		on_lever_activated()
		

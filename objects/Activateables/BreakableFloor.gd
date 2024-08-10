extends Node2D
@onready var area_2d = $Area2D
@onready var fallingstones = $"../fallingstones"

# Called when the node enters the scene tree for the first time.
func activate():
	queue_free()

extends Node2D

@onready var JumpEffect = $DoubleJumpParticle


func Effect():
	JumpEffect.emitting = true
	await get_tree().create_timer(1.5).timeout
	queue_free()

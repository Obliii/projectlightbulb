class_name OptionsMenu
extends Control

@onready var back_button = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/Back_Button as Button


signal exit_options_menu

func _ready():
	back_button.button_down.connect(on_exit_pressed)
	set_process(false)
	
func on_exit_pressed() -> void:
	exit_options_menu.emit()


class_name OptionsMenu
extends Control

@onready var fullscreen_check = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/FullscreenCheck as OptionButton
@onready var back_button = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/Back_Button

signal exit_options_menu

func _ready():
	back_button.button_down.connect(on_exit_pressed)
	set_process(false)
	
func on_exit_pressed() -> void:
	exit_options_menu.emit()

func _on_fullscreen_check_toggled(toggled_on):
	if 	toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		print("working")
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

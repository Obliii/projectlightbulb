class_name MainMenu
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/Start_Button as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_Button as Button
@onready var options_button = $MarginContainer/HBoxContainer/VBoxContainer/Options_Button as Button
@onready var options_menu = $Options_Menu as OptionsMenu
@onready var margin_container = $MarginContainer as MarginContainer

@export var start_level = preload("res://Scenes/ui/main.tscn") as PackedScene

func _ready():
		handle_connecting_signals()
		
func on_start_pressed() -> void:
	GameManager.ChangeLevel("res://scenes/levels/initialLevel.tscn") #TODO: Change this to the first level.
	
func on_options_pressed() -> void:
	margin_container.visible = false
	options_menu.set_process(true)
	options_menu.visible = true

func on_exit_pressed() -> void:
	GameManager.QuitGame()

func on_exit_options_menu() -> void:
	margin_container.visible = true
	options_menu.visible = false

func handle_connecting_signals() -> void:
	start_button.button_down.connect(on_start_pressed)
	options_button.button_down.connect(on_options_pressed)
	exit_button.button_down.connect(on_exit_pressed)
	options_menu.exit_options_menu.connect(on_exit_options_menu)

func _on_mouse_exited():
	$SoundPlayer.play()

	#TODO: PUT IN THE SOUND THAT PLAYS WHEN THE PLAYER HOVERS OVER A BUTTON.
	# I'm placing one here so that you can get an example. <3

	# I did it like this since every other element on the screen is a button.
	# This script is made specifically to detect if the player is touching the control, and not the buttons.
	# SO.. if we leave the control, then the buttons will be hovered. haha.
	# There is a better way to do this I know.

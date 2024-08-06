extends Control

@onready var main = $"../"
@onready var pause_menu = $"."
@onready var canvas_layer = $CanvasLayer

var paused = false

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		print("pausing")
	if Input.is_action_just_pressed("fullscreen_toggle"):
		fullscreenToggle()
		print("fullscreen toggled")

func pauseMenu():
	if paused:
		pause_menu.hide()
		canvas_layer.hide()
		get_tree().paused = false
	else:
		get_tree().paused = true
		canvas_layer.show()
	
	paused = !paused
	
func fullscreenToggle():
	if  DisplayServer.window_get_mode() == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif DisplayServer.window_get_mode() == 3:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
func _on_resume_pressed():
	pauseMenu()
	print("resuming")
	
func _on_menu_pressed():
	get_tree().paused = false
	GameManager.ChangeLevel("res://scenes/ui/main_menu.tscn") #TODO: Change this to the first level.

func _on_quit_pressed():
	GameManager.QuitGame()
	print("quiting")

func _on_mouse_entered():
	$SoundPlayer.play()

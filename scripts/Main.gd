extends Node

########################
#    Signals / Vars    #
########################

@export var CurrentLevelPath : String

# Level Signals
signal LevelChanged # Notifies Game that level was changed.
signal LevelRestarted # Notifies Game that level was restarted.
signal MusicChanged # After calling "ChangeMusic" Function.

signal TimeOver # Time Limit Surpassed

# Player Signals
signal PlayerDeath # Notifies Player has died. TODO: GAME OVER.

##########################
# Basic Scene Management #
##########################\

func QuitGame():
	get_tree().quit(1)

# Changing the Level by inputting a Level Path.
func ChangeLevel(ScenePath): 
	get_tree().change_scene_to_file(ScenePath)
	
	CurrentLevelPath = ScenePath
	LevelChanged.emit()

func RestartLevel():
	ChangeLevel(CurrentLevelPath)

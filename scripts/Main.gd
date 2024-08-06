extends Node

########################
#    Signals / Vars    #
########################

@export var CurrentLevelPath : String

#
#	LEVEL SIGNALS.
#

signal MusicChanged # After calling "ChangeMusic" Function.
signal PuzzleCompleted # Puzzle Completed for a little jingle.

#
#	CAMERA SIGNALS
#

signal ChangeCameraMode(NewMode)
signal ChangeCameraPos(pos: Vector2, zoom: Vector2, followplayer: bool)



##########################
# Basic Scene Management #
##########################\

func QuitGame():
	get_tree().quit(1)

# Changing the Level by inputting a Level Path.
func ChangeLevel(ScenePath): 
	get_tree().change_scene_to_file(ScenePath)
	
func ChangeLevelByScenePacked(ScenePacked):
	get_tree().change_scene_to_packed(ScenePacked)

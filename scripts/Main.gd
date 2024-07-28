extends Node

# Level State - Dictates music.
signal LevelComplete
signal LevelFailed

# Scenes woo.
signal SwapScene(ScenePath)

# Change Music to Path
signal ChangeMusic(MusicPath)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Put Signals together so that they can be called from different scripts. 
	SwapScene.connect(SwapGameScene())
	ChangeMusic.connect(SwapCurrentMusic())
	
	LevelComplete.connect()
	

# Simply Change Game Scenes
func SwapGameScene(ScenePath):
	get_tree().change_scene_to_file(ScenePath)

func SwapCurrentMusic(MusicPath):
	

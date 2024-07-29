class_name LevelDetails
extends Node

@export_group("Basic Level Details")
@export 			  var LevelName : String
@export_file("*.mp3") var LevelMusic

## The Scene's Original Name
var SceneName : String

# This may be out of scope to add in for a level.
# I'll just leave it here as a possibility for later if we get far enough.
@export_group("Time Limit Details")
## Enable Time Limits for this level?
@export var TimerEnabled : bool = false

## How many seconds will the player have to light up this part of the world?
@export var TimeLimit 	 : float

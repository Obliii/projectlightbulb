extends Area2D

@export var mode : TriggerModes = 0

## Multiple ways that Scene Trigger that could be used. Select a TriggerMode and only change the one that you selected.
@export var trigger_only_once : bool = true
@export var triggered : bool = false
@export_group("Trigger Types")

# Trigger Objects
@export_subgroup("Activate Triggers")
@export var connected_objects: Array = []

# Shift the camera around oooo aaahhhhh
@export_subgroup("Change Camera")
## Required if you want to have the camera move.
@export var point : Node2D
## The Zoom that this camera will go to when triggered.
@export var TargetZoom : Vector2 = Vector2(1,1)
## How fast the camera will move when triggered.
@export var TargetZoomSmoothening : float = 2.5
## Follow the player. That's it. Yep. 
@export var TargetFollowPlayer : bool = false

# Just simply changes the scene. I may add a fade to black, then loading screen.
@export_subgroup("Change Scene")
@export var NewScene : PackedScene

enum TriggerModes {
	TRIGGER_ActivateTrigger,  # Player enters and something will activate. // FOR DOORS CLOSING BEHIND THE PLAYER TO KEEP THEM IN AREA - ETC.
	TRIGGER_ChangeCamera, # Player enters and the camera will change.
	TRIGGER_ChangeScene,
}

func _ready():
	
	pass

func _on_body_entered(body):
	if body.is_in_group("Player") and !triggered:
		
		if trigger_only_once:
			triggered = true
		
		match mode:
			TriggerModes.TRIGGER_ActivateTrigger:
				if !connected_objects.is_empty():
					# Activate Objects. Yippee
					ActivateTrigger()
				else:
					print("SCENE TRIGGER FAILED: There are no objects attached to the Activate Trigger")
				return
			
			TriggerModes.TRIGGER_ChangeCamera:
				if point != null:
					# Change where the camera is going to go.
					ChangeCamera()
				else:
					print("SCENE TRIGGER FAILED: Marker2D Required to show the camera where to go.")
				return	
				
			TriggerModes.TRIGGER_ChangeScene:
				if NewScene != null:
					# Change Scene to what is in the trigger
					ChangeScene()
				else:
					print("SCENE TRIGGER FAILED: Scene Needed in the Change Scene trigger.")
				return
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

func ActivateTrigger():
	for object in connected_objects:
		if object.has_method("activate"):
			object.activate()

func ChangeCamera():
	GameManager.ChangeCameraPos.emit(point.position, TargetZoom, TargetFollowPlayer)

func ChangeScene():
	GameManager.ChangeLevelByScenePacked(NewScene)

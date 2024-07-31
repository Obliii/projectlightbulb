class_name PlayerStateMachine
extends Node

@export var initial_state : PlayerState
@export var current_state : PlayerState

@export var states : Dictionary = {}

# Get every state
func _ready():
	for child in get_children():
		if child is PlayerState:
			child.parent = get_parent()
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
			
	if initial_state:
		initial_state.EnterState()
		current_state = initial_state

func _process(delta):
	if current_state:
		current_state.Update(delta)

func _physics_process(delta):
	if current_state:
		current_state.Physics_Update(delta)

func on_child_transition(state):
	if state == current_state.to_string():
		return
	
	var new_state = states.get(state.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state.ExitState()
	
	new_state.EnterState()
	current_state = new_state

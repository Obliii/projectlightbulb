class_name PlayerState
extends Node

var parent: Player

signal Transitioned(state_name)

func EnterState():
	pass

func ExitState():
	pass

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	pass

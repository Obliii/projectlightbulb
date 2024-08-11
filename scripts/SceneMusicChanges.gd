extends Node

@export var NewMusic : AudioStream

func activate():
	GameManager.ChangeMusic(NewMusic)

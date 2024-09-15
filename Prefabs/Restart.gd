extends Node

func restart():
	get_tree().reload_current_scene()
	MusicManager.stage = 0

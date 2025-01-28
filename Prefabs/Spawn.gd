extends Node2D

@export var path : String

func spawn():
	var inst = load(path).instantiate()
	inst.position = $"..".position
	$"../..".add_child(inst)

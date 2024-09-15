class_name Water extends Node

var water_level : float = 0
var water_max := 20.0

var previous_water_level : float

signal water_changed

func _process(delta):
	if (Input.is_action_just_pressed("ui_home")):
		add_water(1)

func add_water(value : float):
	set_water(water_level+value)

func set_water(value : float):
	water_level = clamp(value,0,water_max)
	if (previous_water_level != water_level):
		water_changed.emit()
	previous_water_level = water_level

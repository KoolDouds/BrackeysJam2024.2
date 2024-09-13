extends Node2D


@onready var meteor := preload("res://Prefabs/meteor.tscn")
var timer := 0.0

func _process(delta):
	timer += delta
	if timer > 5:
		timer = 0.0
		spawn()

func spawn():
	print("SPAWN")
	var inst := meteor.instantiate()
	var height := randi_range(1000, 10000)
	var target_pos := position + Vector2(randf_range(-400, 400), randf_range(-400, 400))
	inst.position = target_pos + Vector2.UP * height
	var fall := inst.get_node("Fall")
	fall.target_pos = target_pos
	get_tree().current_scene.add_child(inst)

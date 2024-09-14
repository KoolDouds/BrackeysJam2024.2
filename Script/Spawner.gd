extends Node2D


@onready var meteor := preload("res://Prefabs/meteor.tscn")
var timer := 0.0


func spawn(target_pos: Vector2, height: int = 100.0, speed := 1000.0, monster_count := 1):
	var inst := meteor.instantiate()
	inst.position = target_pos + Vector2.UP * height
	
	var fall := inst.get_node("Fall")
	fall.target_pos = target_pos
	fall.fall_speed = speed
	fall.monster_count = monster_count
	
	$"..".add_child(inst)



#DEFUNCT!!!============================================================
func spawn_random(delta):
	timer += delta
	if timer > 5:
		timer = 0.0
		var target_pos := position + Vector2(randf_range(-400, 400), randf_range(-400, 400))
		var height := randi_range(1000, 10000)
		spawn(target_pos, height, 1000.0, 1)

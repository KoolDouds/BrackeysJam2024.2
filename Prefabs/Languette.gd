extends Control

@onready var post_it_arrow := preload("res://Prefabs/post_it_arrow.tscn")

func add_post_it(time):
	var inst : TextureRect = post_it_arrow.instantiate()
	add_child(inst)
	inst.position = $"Top".position.lerp($"Bottom".position, (time-0.5)/12)
	inst.rotation_degrees = randf_range(-10,10)

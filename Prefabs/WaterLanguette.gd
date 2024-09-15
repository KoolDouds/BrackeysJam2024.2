extends Control

@onready var post_it_arrow := preload("res://Prefabs/water_arrow.tscn")
@onready var water : Water
var post_it

func _ready():
	water = get_tree().get_first_node_in_group("Water")
	
	water.water_changed.connect(update_post_it)
	
	post_it = post_it_arrow.instantiate()
	add_child(post_it)
	update_post_it()


func update_post_it():
	var t = water.water_level/water.water_max
	
	post_it.position = $"Top".position.lerp($"Bottom".position, 1-t)
	post_it.rotation_degrees = randf_range(-5,5)

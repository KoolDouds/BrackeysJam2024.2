extends Node2D

@onready var mover := $"../Mover"
@onready var explosion := preload("res://Prefabs/explosion.tscn")
@onready var monster := preload("res://Prefabs/monster.tscn")

var fall_speed := 1000.0
var target_pos := Vector2.ZERO
var monster_count := 0

func _ready():
	mover.set_destination(target_pos, fall_speed)

func _draw():
	draw_circle(target_pos-global_position, 10, Color.RED)

func _process(delta):
	queue_redraw()
	if global_position.distance_to(target_pos) < fall_speed*delta*0.5:
		die()

# peut-être mettre dans son propre composant? bref je mets ça ici en placeholder
func die():
	var explosion_inst := explosion.instantiate()
	explosion_inst.position = global_position
	get_tree().current_scene.add_child(explosion_inst)
	
	for i in range(monster_count):
		var monster_inst := monster.instantiate()
		monster_inst.position = global_position
		get_tree().current_scene.add_child(monster_inst)
	
	$"..".queue_free()

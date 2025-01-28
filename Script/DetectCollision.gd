@tool
extends Node2D

@export var collide_with : Array[String]

@export var radius : float = 100.0:
	set (v):
		radius = v
		queue_redraw()
@export var offset : Vector2 = Vector2.ZERO:
	set (v):
		offset = v
		queue_redraw()
		
signal collision_detected
signal collision_detected_entity(Node)
var last_collided_with

func _draw():
	draw_arc(offset, radius,0 , TAU,20,Color.CYAN)

func _process(delta):
	if (!visible or Engine.is_editor_hint()): return
	
	for n in collide_with:
		detect(n)

func detect(group_name : String):
	var entities := get_tree().get_nodes_in_group(group_name)
	for e in entities:
		var d = global_position.distance_to(e.global_position)
		if (d <= radius):
			last_collided_with = e
			collision_detected.emit()
			collision_detected_entity.emit(e)


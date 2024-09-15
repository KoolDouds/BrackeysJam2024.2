class_name Build_Pointer extends Node2D

var flaque_selected : Node2D
var water : Water
@onready var build_prefab = preload("res://Prefabs/piege.tscn")

var pieges : Array[Piege] = []

func _ready():
	water = get_tree().get_first_node_in_group("Water")

func _draw():
	for p in pieges:
		if (p == null):continue
		
		var rel_pos :Vector2= p.global_position-global_position
		var dir := (rel_pos).normalized()
		var rad := 50
		draw_arc(rel_pos,rad,0, TAU/4*p.build_time*p.progress,20,Color.WHITE,5)
	

func _process(delta):
	var flaques = get_tree().get_nodes_in_group("Flaque")
	
	if flaques.is_empty(): return
	
	var closest :Node2D= flaques[0]
	var best_dist = 100000
	for f in flaques:
		var dist := global_position.distance_squared_to(f.global_position)
		if (dist < best_dist):
			closest = f
			best_dist = dist
	var range := 200.0
	if (best_dist < range*range):
		flaque_selected = closest
	else:
		flaque_selected = null
	queue_redraw()

func place(time : float):
	var field = get_tree().get_first_node_in_group("ImpactField")
	var inst = build_prefab.instantiate()
	inst.build_time = time
	inst.global_position = global_position
	field.get_parent().add_child(inst)
	pieges.append(inst)
	


class_name Water_pointer extends Node2D

var flaque_selected : Node2D
var water : Water


func _ready():
	water = get_tree().get_first_node_in_group("Water")

func _draw():
	if (flaque_selected != null):
		var rel_pos :Vector2= flaque_selected.global_position-global_position
		var dir := (rel_pos).normalized()
		var rad := 50
		var line_end := rel_pos - dir*rad/2
		draw_dashed_line(Vector2.ZERO, line_end,Color.WHITE,4)
		draw_arc(rel_pos,rad,0,TAU,20,Color.WHITE,2)

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


signal on_collect()
func collect():
	flaque_selected.get_node("DeleteParent").delete_parent()
	water.add_water(1)
	on_collect.emit()

#func place():
	#var field = get_tree().get_first_node_in_group("ImpactField")
	#field.spawn_water(global_position)
	#water.add_water(-1.5)

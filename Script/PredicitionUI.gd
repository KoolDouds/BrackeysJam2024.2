extends Control

var lanes : Array[Lane]
@onready var lane_prefab := preload("res://Prefabs/lane_panel.tscn")


func _ready():
	var field : ImpactField = get_tree().get_first_node_in_group("ImpactField")
	var impact_spots := field.get_different_spots()
	
	var counter := impact_spots.size()
	
	var childs = $Lanes.get_children()
	
	counter = counter - childs.size()
	
	if (counter > 0):
		for c in range(counter):
			var inst = lane_prefab.instantiate()
			$Lanes.add_child(inst)
			childs.append(inst)
	lanes = []
	for i in range(childs.size()):
		var c = childs[i]
		var panel_childs = c.get_children()
		for pc in panel_childs:
			if pc is Lane:
				pc.meteor_id = i
				lanes.append(pc)
				pc.meteor_coord = impact_spots[i]
				pc.init_random_height()


func fall(time : float):
	for l in lanes:
		l.fall_h(time/12)

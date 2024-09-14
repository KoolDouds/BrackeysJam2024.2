extends Control

var lanes : Array[Lane]

func _ready():
	var childs = $Lanes.get_children()
	for c in childs:
		var panel_childs = c.get_children()
		for pc in panel_childs:
			if pc is Lane:
				lanes.append(pc)
				pc.init_random_height()


func fall(time : float):
	for l in lanes:
		l.fall_h(time/12)

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

func _process(delta):
	if (Input.is_action_just_pressed("ui_accept")):
		fall()

func fall():
	for l in lanes:
		l.fall_h(0.1)

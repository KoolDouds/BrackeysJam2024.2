extends Control

var lanes : Array[Lane]

func _ready():
	var childs = get_children()
	
	for c in childs:
		if c is Lane:
			lanes.append(c)
			c.init_random_height()

func _process(delta):
	if (Input.is_action_just_pressed("ui_accept")):
		fall()

func fall():
	for l in lanes:
		l.fall_h(0.1)

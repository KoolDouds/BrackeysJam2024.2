extends Node2D


@export var angle := 0.0
@export var puissance := 0.0

#func _draw():
	#draw_circle(position, 100, Color.RED)

func _process(delta):
	
	if (Input.is_action_pressed("ui_left")):
		angle += 1
	if (Input.is_action_pressed("ui_right")):
		angle -= 1
	if (Input.is_action_pressed("ui_down")):
		puissance *= 0.99
	if (Input.is_action_pressed("ui_up")):
		puissance *= 1.01
	
	var pushables = get_tree().get_nodes_in_group("pushable")
	
	for p in pushables:
		var vector = Vector2.from_angle(deg_to_rad(angle))\
			* puissance\
			/ max(global_position.distance_to(p.get_parent().position)/100, 1)

		p.push(vector)

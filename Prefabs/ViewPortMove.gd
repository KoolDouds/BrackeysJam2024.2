extends Node2D

@export var cam_speed := 500.0 #pixel/seconde

func _process(delta):
	var dir = Vector2.ZERO
	if (Input.is_action_pressed("ui_left")):
		dir += Vector2.LEFT
	if (Input.is_action_pressed("ui_right")):
		dir += Vector2.RIGHT
	if (Input.is_action_pressed("ui_up")):
		dir += Vector2.UP
	if (Input.is_action_pressed("ui_down")):
		dir += Vector2.DOWN
	
	position += dir*cam_speed*delta

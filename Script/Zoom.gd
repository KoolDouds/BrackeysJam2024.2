extends Camera2D



func _process(delta):
	if (Input.is_action_just_pressed("zoom_down")):
		zoom /= 1.5
	if (Input.is_action_just_pressed("zoom_up")):
		zoom *= 1.5

extends Node

var fullscreenToggled := false

func _process(delta):
	if (Input.is_action_just_pressed("toggle_fullscreen")):
		fullscreenToggled = !fullscreenToggled
		if (fullscreenToggled):
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

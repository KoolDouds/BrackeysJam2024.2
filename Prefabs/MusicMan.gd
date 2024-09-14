extends AudioStreamPlayer

var muted := true

func _process(delta):
	if Input.is_action_just_pressed("MuteMusic"):
		muted = !muted
	volume_db = -1000 if muted else 0

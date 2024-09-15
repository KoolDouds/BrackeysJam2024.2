class_name MusicMan extends Node

var muted := true
var total_mute := false

func _ready():
	update_vol()

func _process(delta):
	if Input.is_action_just_pressed("MuteMusic"):
		muted = !muted
	update_vol()

func update_vol():
		$"..".volume_db = -1000 if (muted||total_mute) else -10

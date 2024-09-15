class_name MusicMan extends Node

var muted := false
var total_mute := false
var mult := 1.0
var initial_volume : float

func _ready():
	initial_volume = $"..".volume_db
	update_vol()

func _process(delta):
	if Input.is_action_just_pressed("MuteMusic"):
		muted = !muted
	update_vol()

func update_vol():
	var no_sound = -50.0
	$"..".volume_db = no_sound*10 if (muted||total_mute) else lerp(no_sound,initial_volume,sqrt(sqrt(mult)))

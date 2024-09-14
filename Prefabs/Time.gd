class_name StormTime extends Node

var max_time := 12.0
var current_time := 0.0
var time_speed := 0.0

func skip_time():
	time_speed = 50

func pause_time():
	time_speed = 0

func _process(delta):
	var time_passed = time_speed*delta*1/60
	current_time += time_passed
	$"../Screen/Channels/EcranPrediction/PredicitonUI".fall(time_speed*delta*1/60)

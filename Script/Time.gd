class_name StormTime extends Node

var max_time := 12.0
var current_time := 0.0
var time_speed := 0.0
var impact_times : Dictionary = {}

var storm_time := false

func skip_time():
	if (storm_time):return
	time_speed = 50

func pause_time():
	if (storm_time):return
	time_speed = 0

func add_time_impact(id : int, new_time : float):
	impact_times[id] = new_time

func _process(delta):
	if (storm_time):
		time_speed = 10
	var time_passed = time_speed*delta*1/60
	current_time += time_passed
	
	for i in impact_times.keys():
		if (current_time > impact_times[i] and current_time - time_passed<= impact_times[i]):
			get_tree().get_first_node_in_group("ImpactField").impact_now(i)
			storm_time = true
	
	$"../Screen/Channels/EcranPrediction/PredicitonUI".fall(time_speed*delta*1/60)

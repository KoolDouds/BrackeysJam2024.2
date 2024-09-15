class_name StormTime extends Node

var max_time := 12.0
var current_time := 0.0
var time_speed := 0.0
var impact_times : Dictionary = {}
var time_passed : float

var storm_time := false

var first_impact_time : float = 10000000000.0

func skip_time():
	if (storm_time):return
	time_speed = 50

func pause_time():
	if (storm_time):return
	time_speed = 0

func add_time_impact(id : int, new_time : float):
	impact_times[id] = new_time
	if (new_time < first_impact_time):
		first_impact_time = new_time

func _process(delta):
	if (storm_time):
		time_speed = 10
	time_passed = time_speed*delta*1/60
	current_time += time_passed
	
	MusicManager.set_stage(current_time/first_impact_time *2)
	
	for i in impact_times.keys():
		if (just_passed_this_mark(impact_times[i])):
			get_tree().get_first_node_in_group("ImpactField").impact_now(i)
			storm_time = true
			MusicManager.set_stage(3)
	
	$"../Screen/Channels/EcranPrediction/PredicitonUI".fall(time_speed*delta*1/60)

func just_passed_this_mark(mark : float) -> bool:
	return current_time > mark and current_time - time_passed<= mark

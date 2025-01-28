class_name Piege extends Node2D

var build_time := 1
var build_end_time : float
var built := false
var progress := 0.0

signal build_finished()

var time : StormTime

func _ready():
	time = get_tree().get_first_node_in_group("Time") as StormTime
	build_end_time = time.current_time + build_time

func _process(delta):
	if (built || time.current_time >= build_end_time):
		if (!built):
			$DetectCollision2.queue_free()
			$DetectCollision.visible = true
			build_finished.emit()
		built = true
		progress = 0
	else:
		$DetectCollision.visible = false
		progress = (build_end_time-time.current_time)/build_time

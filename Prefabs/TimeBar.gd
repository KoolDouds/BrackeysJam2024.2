extends TextureProgressBar


var time : StormTime

func _ready():
	time = get_tree().get_first_node_in_group("Time")
	
func _process(delta):
	value = time.current_time

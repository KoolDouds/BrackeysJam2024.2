extends Button

var time : StormTime
var drinking := false

func start_drinking():
	drinking = true
	

func stop_drinking():
	drinking = false
	time.pause_time()

func _ready():
	time = get_tree().get_first_node_in_group("Time")

func _process(delta):
	if (drinking and !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		stop_drinking()
	$"../Slurp".visible = drinking
	visible = !drinking

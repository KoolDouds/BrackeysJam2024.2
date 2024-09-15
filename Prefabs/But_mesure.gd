extends Button

var water : Water

func _ready():
	water = get_tree().get_first_node_in_group("Water")

func _process(delta):
	text = "Mesure [-"+str($"../../Lane".cost)+" water]"
	disabled = water.water_level < $"../../Lane".cost

extends Button

var water_pointer : Water_pointer

func _ready():
	water_pointer = get_tree().get_first_node_in_group("Cursor").get_node("WaterPointer")

func _process(delta):
	disabled = water_pointer.flaque_selected == null

func _pressed():
	water_pointer.collect()

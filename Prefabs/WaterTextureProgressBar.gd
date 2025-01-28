extends TextureProgressBar

@onready var water : Water

func _ready():
	water = get_tree().get_first_node_in_group("Water")

func _process(delta):
	update_level()

func update_level():
	value = water.water_level/water.water_max

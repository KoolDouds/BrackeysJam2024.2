extends Control

var water_cost := 2
var time_cost := 3

var water : Water
var build_pointer : Build_Pointer

func _ready():
	water = get_tree().get_first_node_in_group("Water")
	build_pointer = get_tree().get_first_node_in_group("BuildPointer")

func reduce_cost():
	trade(-1)

func reduce_time():
	trade(1)

func trade(value : float):
	water_cost = clamp(water_cost + value, 1,5)
	time_cost = clamp(time_cost - value, 0,4)

func place_disabled() -> bool:
	return water.water_level < water_cost

func place():
	water.add_water(-water_cost)
	build_pointer.place(time_cost)
	

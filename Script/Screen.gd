extends Control

@export var active_screen := 0
@onready var screens : Array[Control] = []
@export var brightness : Array[float] = []
@export var move_enabled : Array[bool] = []
@export var cursor_enabled : Array[int] = [] #0:rien,1:water,2:build,3:juste curseur
@onready var light : CanvasItem = $"../../TV/Light"

func _ready():
	var childs = get_children()
	for c in childs:
		if c is Control:
			screens.append(c)
	set_active_screen(active_screen)

func switch_screen():
	switch_to_screen(active_screen+1)

func switch_back():
	switch_to_screen(active_screen+screens.size()-1)

func switch_to_screen(num):
	$"../TvNoise".visible = true
	$"../Titre".visible = false
	light.material.set_shader_parameter("alpha", 1)
	
	await get_tree().create_timer(0.2).timeout
	
	set_active_screen(num)
	$"../TvNoise".visible = false

func set_active_screen(num : int):
	active_screen = num%screens.size()
	for i in range(screens.size()):
		screens[i].visible = i == active_screen
	get_tree().get_first_node_in_group("ViewPort").set_enable_move(move_enabled[active_screen])
	get_tree().get_first_node_in_group("Cursor").visible = cursor_enabled[active_screen]!=0
	get_tree().get_first_node_in_group("Cursor").get_node("WaterPointer").visible =  cursor_enabled[active_screen]==1
	get_tree().get_first_node_in_group("Cursor").get_node("BuildPointer").visible =  cursor_enabled[active_screen]==2
	light.material.set_shader_parameter("alpha", brightness[active_screen])

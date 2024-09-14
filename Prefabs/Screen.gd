extends Control

@export var active_screen := 0
@onready var screens : Array[Control] = []
@export var brightness : Array[float] = []
@onready var light : CanvasItem = $"../../TV/Light"

func _ready():
	var childs = get_children()
	for c in childs:
		if c is Control:
			screens.append(c)
	switch_to_screen(active_screen)

func switch_screen():
	switch_to_screen(active_screen+1)

func switch_to_screen(num):
	$"../TvNoise".visible = true

	light.material.set_shader_parameter("alpha", 1)
	
	await get_tree().create_timer(0.2).timeout
	
	set_active_screen(num)
	$"../TvNoise".visible = false

func set_active_screen(num : int):
	active_screen = num%screens.size()
	for i in range(screens.size()):
		screens[i].visible = i == active_screen
	light.material.set_shader_parameter("alpha", brightness[active_screen])

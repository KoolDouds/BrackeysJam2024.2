extends Node2D

@export var temp := 0.0
@onready var prefab := preload("res://objet.tscn")

func _draw():
	print("ok c bon j'ai fini")
	draw_circle(Vector2.ZERO, 100, Color.CYAN.lerp(Color.ORANGE, temp/100.0))

func _process(delta):
	if (Input.is_action_just_pressed("ui_accept")):
		var inst = prefab.instantiate()
		inst.position = position
		inst.get_node("Temperature").temp = temp
		get_tree().current_scene.add_child(inst)
	
	if (Input.is_action_just_pressed("ui_page_down")):
		print(temp)
		temp -= 10
		queue_redraw()
	if (Input.is_action_just_pressed("ui_page_up")):
		print(temp)
		temp += 10
		queue_redraw()


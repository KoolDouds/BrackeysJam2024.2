class_name Hittable
extends Node2D

@export var show_health := false
@export var max_health := 10
@onready var health := max_health

signal on_die

func _draw():
	if (show_health):
		draw_arc(Vector2.DOWN*100, 20,0,TAU*(health*1.05)/max_health,30,Color(0.5,0.3,0.5,1),10)

func _process(delta):
	if (show_health):
		queue_redraw()

func hit(dmg: int):
	health -= dmg
	if health <= 0:
		die()

func die():
	on_die.emit()
	$"..".queue_free()

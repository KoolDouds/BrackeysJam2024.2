@tool
class_name ImpactZone extends Node2D

@export var radius : float = 200:
	set(value):
		radius = value
		queue_redraw()


func _draw():
	if (Engine.is_editor_hint()):
		draw_arc(Vector2.ZERO, radius, 0, TAU,20,Color.RED)

func _process(delta):
	if (Engine.is_editor_hint()):
		queue_redraw()

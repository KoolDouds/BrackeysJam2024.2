@tool
class_name Zone extends Node2D

@export var radius : float = 200:
	set(value):
		radius = value
		queue_redraw()

@export var no_impact := false
@export var water_quantity := 5

func _draw():
	if (Engine.is_editor_hint()):
		draw_arc(Vector2.ZERO, radius, 0, TAU,20,Color.RED if !no_impact else Color.CYAN)

func _process(delta):
	if (Engine.is_editor_hint()):
		queue_redraw()

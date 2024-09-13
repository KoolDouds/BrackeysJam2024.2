extends Control

@export var col : Color
@export var radius := 5.0

func _draw():
	draw_circle(Vector2.ZERO, radius, col)

func _process(delta):
	queue_redraw()

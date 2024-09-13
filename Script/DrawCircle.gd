extends Control

@export var col : Color

func _draw():
	draw_circle(Vector2.ZERO, 20, col)

func _process(delta):
	queue_redraw()

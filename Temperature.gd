extends Node2D

var temp := 0.0
var size := 50

func _draw():
	draw_circle(position, size, Color.CYAN.lerp(Color.ORANGE, temp/100.0))

func change_size(new_size):
	size = new_size
	queue_redraw()

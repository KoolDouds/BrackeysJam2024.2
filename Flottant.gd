extends Node2D

var acc := Vector2(0,0)
var vel := Vector2(0,0)

func push(dir : Vector2):
	acc = dir

func _process(delta):
	vel += acc
	$"..".position += vel
	vel *= 0.5

extends Node2D

var velocity := Vector2.ZERO

func _process(delta):
	$"..".position += velocity*delta

func set_velocity(dir: Vector2, magnitude: float):
	velocity = dir*magnitude

extends Node2D

var velocity := Vector2.ZERO

func _process(delta):
	$"..".position += velocity*delta

func set_velocity(dir: Vector2, magnitude: float):
	velocity = dir*magnitude

func set_destination(target: Vector2, speed: float):
	var dir := (target - global_position).normalized()
	set_velocity(dir, speed)

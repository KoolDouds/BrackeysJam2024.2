class_name Hittable
extends Node2D

@export var max_health := 10
var health := max_health

signal on_die

func hit(dmg: int):
	health -= dmg
	if health <= 0:
		die()

func die():
	on_die.emit()
	$"..".queue_free()

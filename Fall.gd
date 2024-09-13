extends Node2D


@onready var mover := $"../Mover"
@onready var explosion := preload("res://explosion.tscn")

var fall_speed := 1000.0
var target_pos := Vector2.ZERO

func _ready():
	var dir := (target_pos - global_position).normalized()
	mover.set_velocity(dir, fall_speed)

func _draw():
	draw_circle(target_pos-global_position, 10, Color.RED)

func _process(delta):
	queue_redraw()
	if global_position.distance_to(target_pos) < fall_speed*delta*0.5:
		die()

# peut-être mettre dans son propre composant? bref je mets ça ici en placeholder
func die():
	var inst := explosion.instantiate()
	inst.position = $"..".position
	inst.get_node("CPUParticles2D").emitting = true
	get_tree().current_scene.add_child(inst)
	$"..".queue_free()

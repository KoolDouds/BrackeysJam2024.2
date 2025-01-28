class_name EmitOnSpawn
extends Node2D

@onready var particles := $"..".find_children("*", "CPUParticles2D")

func _ready():
	for p in particles:
		p.emitting = true


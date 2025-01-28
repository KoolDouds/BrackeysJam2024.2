extends Node

@export var target : CanvasItem


# Called when the node enters the scene tree for the first time.
func _ready():
	if (target == null):
		target = $"../.."
	target.visibility_changed.connect(update_mute)
	$"../Mute".total_mute = !target.visible

func update_mute():
	$"../Mute".total_mute = !target.visible

extends Node

@export var target : CanvasItem
var initial_volume : float

# Called when the node enters the scene tree for the first time.
func _ready():
	if (target == null):
		target = $"../.."
	initial_volume = $"..".volume_db
	target.visibility_changed.connect(update_mute)

func update_mute():
	$"..".volume_db = initial_volume if target.visible else -1000

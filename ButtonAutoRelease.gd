extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$"..".pressed.connect(press)

func press():
	$"..".release_focus()

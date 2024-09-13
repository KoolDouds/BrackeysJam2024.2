extends Control

func _ready():
	$"..".mouse_entered.connect(visible_on)
	$"..".mouse_exited.connect(visible_off)
	visible_off()

func visible_on():
	visible = true
	
func visible_off():
	visible = false

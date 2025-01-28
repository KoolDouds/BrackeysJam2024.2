extends Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Precision: ["+str(100-$"../../Lane".angle)+"%]"

extends Button


func _process(delta):
	var build = $"../Build"
	
	disabled = build.place_disabled()
	
	text = ">> PLACE <<
			Water  Time
			["+str(-build.water_cost)+"]      ["+str(build.time_cost)+"]"

func _pressed():
	$"../Build".place()

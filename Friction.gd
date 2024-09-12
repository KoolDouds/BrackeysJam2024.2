extends Node2D


func _process(delta):
	var fricitons = get_tree().get_nodes_in_group("Friction")
	
	for f in fricitons:
		if (f != self):
			var dist :float = $"..".global_position.distance_to(f.get_parent().global_position)
			if (dist < $"../Temperature".size+f.get_parent().get_node("Temperature").size):
				var tempDif = abs($"../Temperature".temp - f.get_parent().get_node("Temperature").temp)
				if (tempDif > 25):
					print("boom")
					$"..".queue_free()
					f.get_parent().queue_free()
				else:
					$"../Temperature".temp*2
					$"../Temperature".change_size($"../Temperature".size+f.get_parent().get_node("Temperature").size)
					f.get_parent().queue_free()

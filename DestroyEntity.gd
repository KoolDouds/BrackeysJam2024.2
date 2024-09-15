extends Node

func destroy_entity(entity : Node):
	var hit = entity.find_child("Hittable")
	if (hit != null):
		hit.die()
	else:
		entity.queue_free()

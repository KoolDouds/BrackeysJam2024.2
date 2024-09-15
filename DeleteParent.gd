extends Node


func delete_parent():
	$"..".queue_free()

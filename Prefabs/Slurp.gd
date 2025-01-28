extends Control


func _process(delta):
	$AudioStreamPlayer.volume_db = -100 if !$"..".visible else -5


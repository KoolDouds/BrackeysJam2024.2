extends Node

var musics : Array[MusicMan]
var stage : int = 0

func _ready():
	var childs = get_children()
	musics = []
	for c in childs:
		var m = c.get_node("Mute")
		if (m != null and m is MusicMan):
			musics.append(m)

func _process(delta):
	if (Input.is_action_just_pressed("ui_home")):
		stage = (stage+1)%musics.size()
	
	for i in range(musics.size()):
		musics[i].total_mute = i != stage

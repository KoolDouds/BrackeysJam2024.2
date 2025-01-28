extends Node

var musics : Array[MusicMan]
var stage : float = 0

func _ready():
	var childs = get_children()
	musics = []
	for c in childs:
		var m = c.get_node("Mute")
		if (m != null and m is MusicMan):
			musics.append(m)

func _process(delta):
	if (stage >= 2):
		for i in range(musics.size()):
			musics[i].total_mute = i != 3
	else:
		var floor_stage = floor(stage)
		var progress = stage-floor_stage
		for i in range(musics.size()):
			musics[i].total_mute = (i != floor_stage && i != floor_stage +1)
			if (i == floor_stage):
				musics[i].mult = 1.0-(progress)
			elif (i == floor_stage+1):
				musics[i].mult = (progress)

func set_stage(value : float):
	stage = clamp(value,0,musics.size()-1)


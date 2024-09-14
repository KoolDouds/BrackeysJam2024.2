extends Camera2D

@export var zooms : Array[float]
@export var pos : Array[Vector2]

var index = 0

func cycle_zoom_pos():
	set_zoom_pos(index+1)

func set_zoom_pos(num : int):
	index = num%zooms.size()

func _process(delta):
	if (Input.is_action_just_pressed("ui_accept")):
		cycle_zoom_pos()
	
	zoom = lerp(zoom, Vector2.ONE*zooms[index], 0.3)
	position = position.lerp(pos[index], 0.3)

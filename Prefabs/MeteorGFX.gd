@tool
class_name MeteorGFX extends Control

@export var id : int = 4
@export var col : Color = Color.DARK_RED

func _draw():
	draw_circle(Vector2.ZERO,15,col)
	draw_arc(Vector2.ZERO,15,0,TAU,20,Color.WHITE,2)
	
	for i in range(id+1):
		var x = -0.5 + 1.0/(id+2) + float(i)/(id+2)
		draw_line(
			Vector2.LEFT*x*25+Vector2.UP*7,
			Vector2.LEFT*x*25+Vector2.DOWN*7,
			Color.WHITE,4)

func _process(delta):
	queue_redraw()

@tool
extends Node2D


func _draw():
	draw_line(Vector2.LEFT*50,Vector2.LEFT*10,Color.WHITE,3)
	draw_line(Vector2.UP*50,Vector2.UP*10,Color.WHITE,3)
	draw_line(Vector2.RIGHT*50,Vector2.RIGHT*10,Color.WHITE,3)
	draw_line(Vector2.DOWN*50,Vector2.DOWN*10,Color.WHITE,3)
	
	draw_line(Vector2.LEFT*1000,Vector2.RIGHT*1000,Color(1,1,1,0.2),-1)
	draw_line(Vector2.UP*1000,Vector2.DOWN*1000,Color(1,1,1,0.2),-1)
	
	
func _process(delta):
	if (Engine.is_editor_hint()):return
	scale = Vector2.ONE*1.0/$"../..".zoom.x
	queue_redraw()

class_name Lane extends Control

@onready var sky_point :Control = $SkyPoint
@onready var impact_point :Control = $ImpactPoint
@onready var meteor := $Meteor

var meteor_h := 1.0 #height normalisé 0->1
var meteor_coord : Vector2
var vitesse := 1.0
var MAX_ERROR := 300

var angle : float = 20.0
var error_radius : float = 0
var predictions : Array[Vector2] = []

func _draw():
	var col := Color(0,1,1,0.2)
	var pixel_h = abs(sky_point.position.y - impact_point.position.y)
	var pixel_error_radius = error_radius * pixel_h
	draw_line(
		impact_point.position + Vector2.LEFT*pixel_error_radius,
		impact_point.position + Vector2.RIGHT*pixel_error_radius,col,55)
	draw_line(
		impact_point.position + Vector2.LEFT*pixel_error_radius,
		meteor.position,col,3)
	draw_line(
		impact_point.position + Vector2.RIGHT*pixel_error_radius,
		meteor.position,col,3)
	draw_line(
		impact_point.position,
		meteor.position,Color.WHITE,3)
	
	draw_arc(meteor.position, 150, 
	PI/2.0, 
	(PI/2.0)-deg_to_rad(angle),
	10,Color.WHITE, 10)

func init_random_height():
	var disp_h = 0.3
	meteor_h = (1-disp_h) + disp_h * randf()
	var disp_v = 0.3
	vitesse = (1-disp_v/2.0) + disp_v * randf()
	meteor.position = impact_point.position.lerp(sky_point.position, meteor_h)
	update_error()

func _process(delta):
	meteor.position = impact_point.position.lerp(sky_point.position, meteor_h)

func press_increase_precision():
	set_precision(angle - 5)

func press_decrease_precision():
	set_precision(angle + 5)

func set_precision(new_angle : float):
	angle = clamp(new_angle, 0, 89)
	update_error()

func fall_h(decrease : float):
	decrease_h(decrease*vitesse)

func decrease_h(decrease : float):
	set_h(meteor_h - decrease)

func set_h(value : float):
	meteor_h = clamp(value, 0, 1)
	update_error()

func press_mesure():
	mesure()

func update_error():
	error_radius = meteor_h * tan(deg_to_rad(angle))
	queue_redraw()

func mesure():
	update_error()
	var dir := Vector2.from_angle(randf()*2*PI)
	var error_normalize : float = randf()
	var predicition : Vector2 = meteor_coord + dir * error_radius * error_normalize
	predictions.append(predicition)

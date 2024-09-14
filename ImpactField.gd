@tool
class_name ImpactField extends Node2D

@export var meteor_count := 3:
	set (c):
		meteor_count = c
		get_different_spots()
var zones : Array[ImpactZone]
var impact_spots : Array[Vector2] = []

var predictionary : Dictionary = {}

func _ready():
	var childs = get_children()
	
	for c in childs:
		if (c is ImpactZone):
			zones.append(c)

func _draw():
	#if(Engine.is_editor_hint()):
	for c in impact_spots:
		draw_circle(c-global_position,20,Color.WHITE)
	for i in range(impact_spots.size()):
		if (predictionary.has(i)):
			for p in predictionary[i]:
				draw_circle(p.coord,15, Color.WHITE)
				draw_circle(p.coord,12, Color.BLACK)
				draw_circle(p.coord,10, Color.WHITE)
				draw_arc(p.coord,p.radius,0,TAU,20, Color.WHITE)
				draw_line(p.coord, impact_spots[i],Color.WHITE,2)

func get_different_spots() -> Array[Vector2]: 
	var zone_shuffle :Array[ImpactZone]= zones.duplicate()
	zone_shuffle.shuffle()
	
	impact_spots = []
	for i in range(meteor_count):
		var zone : ImpactZone = zone_shuffle[i%zone_shuffle.size()]
		var random_angle = randf() * TAU
		var random_radius = randf() * zone.radius
		var impact_coord = zone.global_position + Vector2.from_angle(random_angle)*random_radius
		impact_spots.append(impact_coord)
	queue_redraw()
	return impact_spots

func add_prediction( id:int, coord, radius):
	if (!predictionary.has(id)):
		predictionary[id] = []
	predictionary[id].append(Prediction.new(id, coord, radius))
	queue_redraw()

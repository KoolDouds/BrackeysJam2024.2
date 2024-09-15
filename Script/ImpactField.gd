@tool
class_name ImpactField extends Node2D

@export var meteor_count := 3
var impact_zones : Array[Zone] = []
var water_zones : Array[Zone] = []
var impact_spots : Array[Vector2] = []
var landed : Array[bool] = []
var num_of_zone_with_water := 4
@onready var water_prefab := preload("res://Prefabs/flaque.tscn")

var predictionary : Dictionary = {}

func _ready():
	var childs = get_children()
	
	for c in childs:
		if (c is Zone):
			if (!c.no_impact):
				impact_zones.append(c)
			water_zones.append(c)
	
	spawn_all_water()

func _draw():
	#if(Engine.is_editor_hint()):
	for c in impact_spots:
		draw_circle(c-global_position,20,Color.WHITE)
	for i in range(impact_spots.size()):
		if (predictionary.has(i) and !landed[i]):
			for p in predictionary[i]:
				draw_circle(p.coord,15, Color.WHITE)
				draw_circle(p.coord,12, Color.BLACK)
				draw_circle(p.coord,10, Color.WHITE)
				draw_arc(p.coord,p.radius,0,TAU,20, Color.WHITE)
				draw_line(p.coord, impact_spots[i],Color.WHITE,2)

func get_different_spots() -> Array[Vector2]: 
	if (impact_zones.is_empty()):
		_ready()
	
	var zone_shuffle :Array[Zone]= impact_zones.duplicate()
	zone_shuffle.shuffle()
	
	impact_spots = []
	landed = []
	for i in range(meteor_count):
		var zone : Zone = zone_shuffle[i%zone_shuffle.size()]
		var random_angle = randf() * TAU
		var random_radius = randf() * zone.radius
		var impact_coord = zone.global_position + Vector2.from_angle(random_angle)*random_radius
		impact_spots.append(impact_coord)
		landed.append(false)
	queue_redraw()
	return impact_spots

func spawn_all_water():
	if (water_zones.is_empty()):
		_ready()
	
	var zone_shuffle :Array[Zone]= water_zones.duplicate()
	zone_shuffle.shuffle()
	
	for i in range(num_of_zone_with_water):
		var w : Zone = water_zones[i%zone_shuffle.size()]
		for aaaa in range(w.water_quantity):
			var random_angle = randf() * TAU
			var random_radius = randf() * w.radius
			var coord = w.global_position + Vector2.from_angle(random_angle)*random_radius
			spawn_water(coord)

func spawn_water(coord : Vector2):
	var inst = water_prefab.instantiate()
	inst.position = coord
	$"../Flaques".add_child(inst)

func add_prediction( id:int, prediction : Prediction):
	if (!predictionary.has(id)):
		predictionary[id] = []
	predictionary[id].append(prediction)
	queue_redraw()

func impact_now(id : int):
	$"../Spawner".spawn(impact_spots[id])
	landed[id] = true
	queue_redraw()

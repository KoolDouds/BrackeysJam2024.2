extends Control

var on := true
@export var id := 0

var field : ImpactField

func _ready():
	field = get_tree().get_first_node_in_group("ImpactField")
	var chi = get_children()
	for c in chi:
		if c is MeteorGFX:
			c.id = id
	chi = $HL.get_children()
	for c in chi:
		if c is MeteorGFX:
			c.id = id

func _process(delta):
	if (field.filters.has(id)):
		on = field.filters[id]
	visible = field.filters.has(id)
	$TextureRect2.visible = on

func toggle():
	if (field.filters.has(id)):
		on = !field.filters[id]
		field.filters[id] = on
		field.queue_redraw()


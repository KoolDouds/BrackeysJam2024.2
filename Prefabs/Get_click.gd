class_name MyButton extends Control

@export var hover_highlight : CanvasItem
var hover := false
var clicked := false
var clicked_on_previous_frame := false
signal just_clicked
signal just_released

func _ready():
	mouse_entered.connect(enter)
	mouse_exited.connect(exit)

func _process(delta):
	if (hover_highlight != null):
		hover_highlight.visible = hover
	
	if (hover):
		clicked = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)
	else:
		clicked = false
	
	if (clicked != clicked_on_previous_frame) && clicked:
		just_clicked.emit()
	if (clicked != clicked_on_previous_frame) && clicked_on_previous_frame:
		just_released.emit()
	
	clicked_on_previous_frame = clicked

func enter():
	hover = true

func exit():
	hover = false

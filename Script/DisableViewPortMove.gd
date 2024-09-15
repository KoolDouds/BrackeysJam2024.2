extends Node

func _on_rien_visibility_changed():
	if (get_tree() != null):
		get_tree().get_first_node_in_group("ViewPort").set_enable_move($"..".visible)

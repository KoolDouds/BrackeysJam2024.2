extends Node2D


func game_over():
	get_tree().get_first_node_in_group("GameOver").visible = true

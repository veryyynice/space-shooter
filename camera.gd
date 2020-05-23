extends Node2D

onready var screen_width = ProjectSettings.get_setting("display/window/size/width")

func _on_player_move():
	print("works")
	var canvas_transform = get_viewport().get_canvas_transform()
	canvas_transform[2] = get_node('Playter').get_pos() + screen_width/2
	get_viewport().set_canvas_transform(canvas_transform)

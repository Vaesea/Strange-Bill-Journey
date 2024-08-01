extends Button





func _on_button_down():
	print("yeah")
	get_tree().change_scene_to_file("res://play_game.tscn")

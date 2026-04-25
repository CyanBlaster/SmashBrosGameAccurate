extends Node2D



func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("Char1Select")):
		print("Mario")
	elif(Input.is_action_just_pressed("Char2Select")):
		print("Link")
	elif(Input.is_action_just_pressed("Char3Select")):
		print("Mega Man")
	elif(Input.is_action_just_pressed("Char4Select")):
		print("Sonic")


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://battlefield.tscn")

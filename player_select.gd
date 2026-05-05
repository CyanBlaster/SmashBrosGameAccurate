extends Node2D

@export var player1 = 1
@export var player2 = 1
@export var player1select : Node2D
@export var player2select : Node2D

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
	player1 = player1select.character
	player2 = player2select.character
	Player_Select.player1 = player1select.character
	Player_Select.player2 = player2select.character
	print(player1)
	print(player2)
	get_tree().change_scene_to_file("res://battlefield.tscn")

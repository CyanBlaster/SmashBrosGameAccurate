extends Node2D
@export var One : Sprite2D
@export var Two : Sprite2D
@export var Three : Sprite2D
@export var Four : Sprite2D
@export var chara : Node2D
var player = 1
var game_start = false

func _process(_delta: float) -> void:
	if(chara.select):
		if(Input.is_action_just_pressed("Char1Select") && chara.select):
			print("Mario")
			player = 1
			One.show()
			Two.hide()
			Three.hide()
			Four.hide()
			game_start = true
		elif(Input.is_action_just_pressed("Char2Select") && chara.select):
			print("Link")
			player = 2
			One.hide()
			Two.show()
			Three.hide()
			Four.hide()
			game_start = true
		elif(Input.is_action_just_pressed("Char3Select") && chara.select):
			print("Mega Man")
			player = 3
			One.hide()
			Two.hide()
			Three.show()
			Four.hide()
			game_start = true
		elif(Input.is_action_just_pressed("Char4Select") && chara.select):
			print("Sonic")
			player = 4
			One.hide()
			Two.hide()
			Three.hide()
			Four.show()
			game_start = true
		
	

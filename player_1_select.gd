extends Node2D
@export var One : Sprite2D
@export var Two : Sprite2D
@export var Three : Sprite2D
@export var Four : Sprite2D
var player = 1
@export var select = false

func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("Char1Select") && !select):
		select = true
		print("Mario")
		player = 1
		One.show()
		Two.hide()
		Three.hide()
		Four.hide()
	elif(Input.is_action_just_pressed("Char2Select") && !select):
		select = true
		print("Link")
		player = 2
		One.hide()
		Two.show()
		Three.hide()
		Four.hide()
	elif(Input.is_action_just_pressed("Char3Select") && !select):
		select = true
		print("Mega Man")
		player = 3
		One.hide()
		Two.hide()
		Three.show()
		Four.hide()
	elif(Input.is_action_just_pressed("Char4Select") && !select):
		select = true
		print("Sonic")
		player = 4
		One.hide()
		Two.hide()
		Three.hide()
		Four.show()

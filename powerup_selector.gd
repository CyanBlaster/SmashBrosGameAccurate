extends Node2D

@export var Mario : CharacterBody2D
@export var animator : AnimationPlayer
var timer = 0.5

func powerup_check():
	if(Mario.player == 2):
		if(Input.is_action_just_pressed("Player2Switch")):
			return true
		else:
			return false
	else:
		if(Input.is_action_just_pressed("Player1Shield")):
			return true
		else:
			return false

func _ready() -> void:
	hide()

func _process(_delta: float) -> void:
	if(timer > 0): 
		timer -= _delta
	else:
		hide()
	if(powerup_check() && Mario.powerup == 0 && timer <= 0):
		animator.play("Fire_Flower")
		Mario.powerup = 1
		show()
		timer = 3
	elif(powerup_check() && Mario.powerup == -1 && timer <= 0):
		animator.play("Mushroom")
		Mario.powerup = 0
		show()
		timer = 3
 
 

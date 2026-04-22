extends Label
@export var player : CharacterBody2D


func _process(_delta): 
	show()
	text = "Rings:" + str(player.rings)
	

extends Label
@export var player : CharacterBody2D


func _process(_delta):
	if(player.weapon == 2): 
		show()
		text = str(player.metal_blade_energy)
	elif(player.weapon == 3): 
		show()
		text = str(player.metal_blade_energy)
	else:
		hide()
 

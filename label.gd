extends Label
@export var player : CharacterBody2D


func _process(_delta):
	text = str(player.metal_blade_energy)

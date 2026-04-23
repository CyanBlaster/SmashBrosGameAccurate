extends Node2D
@export var collision : CollisionShape2D
@export var player : CharacterBody2D
var health = 3

func _ready():
	collision.disabled = true
	hide()
	
func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("Player1Shield")):
		print("shield")
		player.shield = true
		health = 3
		collision.disabled = false
		show()
	if(health <= 0):
		collision.disabled = true
		player.shield = false
		hide()
func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name.begins_with("buster_") || body.name.begins_with("blade_")):
		#print(body.name)
		health -= 1
	



func _on_shieldo_area_entered(area: Area2D) -> void:
	if(area.name.begins_with("buster_") || area.name.begins_with("blade_")):
		#print(body.name)
		health -= 1

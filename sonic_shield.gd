extends Node2D
@export var collision : CollisionShape2D
@export var player : CharacterBody2D
var health = 3

func _ready():
	collision.disabled = true
	hide()
	
func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("Player1Shield")):
		player.shield = true
		health = 3
		collision.disabled = false
		show()
		health = 3
		show()
func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name.begins_with("buster_") || body.name.begins_with("blade_")):
		#print(body.name)
		health -= 1
	if(health <= 0):
		collision.disabled = true
		player.shield = false
		hide()

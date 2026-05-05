extends Node2D
@export var collision : CollisionShape2D
@export var player : CharacterBody2D
var health = 4
var timer = 0

func _ready():
	collision.disabled = true
	hide()
	
func _process(delta: float) -> void:
	if (timer > 0):
		timer -= delta
	
	if(Input.is_action_just_pressed("Player1Shield") && player.shield == false && timer <= 0):
		print("shield")
		player.shield = true
		health = 4
		collision.disabled = false
		show()
	if(health <= 0):
		collision.disabled = true
		player.shield = false
		hide()
func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name.begins_with("buster_") || body.name.begins_with("blade_") || body.name.begins_with("air")):
		health -= 1
		if(health <= 0):
			collision.disabled = true
			player.shield = false
			timer = 10
			hide()

func _on_shieldo_area_entered(area: Area2D) -> void:
	if(area.name.begins_with("buster_") || area.name.begins_with("blade_") || area.name.begins_with("air") || area.name.begins_with("fireball") || area.name == ("Jump")):
		health -= 1
		if(health <= 0):
			collision.disabled = true
			player.shield = false
			timer = 10
			hide()

extends CharacterBody2D


const SPEED = 500.0
var direction = 1
var timer = false
var time = 0.4

func _ready() -> void:
	pass
 
func _physics_process(delta: float) -> void:
	position.x += direction * SPEED * delta
	position.y -= SPEED * delta
	if(timer):
		time -= delta
	if(time <= 0):
		queue_free()
#
#func _on_area_2d_area_entered(_area: Area2D) -> void:
	#timer = true



func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name == "Shield"):
		timer -= 0.25
		timer = true
	if(body.name == "Sonic"):
		timer = true

extends CharacterBody2D

const SPEED = 500.0
var direction = 1
var timer = false
var time = 0.1

func _ready() -> void:
	pass
 
func _physics_process(delta: float) -> void:
	position.x += direction * SPEED * delta
	if(timer):
		time -= delta
	if(time <= 0):
		queue_free()
func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name == "shieldo"):
		#body.health -= 1
		print(" ")
		queue_free()
	if(body.name == "Sonic"):
		timer = true
		


func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.name == "shieldo"): 
		time = 0.05
		timer = true
	if(area.name == "barrier"):
		queue_free()

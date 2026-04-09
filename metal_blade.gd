extends CharacterBody2D


const SPEED = 500.0
var direction = 1

func _ready() -> void:
	pass
 
func _physics_process(delta: float) -> void:
	position.x += direction * SPEED * delta

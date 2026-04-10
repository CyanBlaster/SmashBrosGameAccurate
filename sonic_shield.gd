extends Node2D
@export var collision : CollisionShape2D
var health = 3

func _ready():
	collision.disabled = false
	
func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("Player1Shield")):
		health = 3
		collision.disabled = false
		show()
		


func _on_area_2d_body_entered(_body: Node2D) -> void:
	health -= 1
	if(health <= 0):
		collision.disabled = true
		hide()

extends CharacterBody2D
var JUMP_VELOCITY = -200.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		velocity.y = JUMP_VELOCITY
		JUMP_VELOCITY += delta
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.name == "Left" || area.name == "Right"):
		queue_free()

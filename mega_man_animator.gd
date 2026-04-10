extends Node2D

@export var animator : AnimationPlayer
@export var player_controller : Player_Controller2
@export var sprite : Sprite2D
@export var shape_normal : CollisionShape2D
@export var shape_slide : CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(player_controller.velocity.y < 0.0):
		animator.play("Jump")
		shape_normal.disabled = false
		shape_slide.disabled = true 
	elif(player_controller.velocity.y > 0.0):
		animator.play("Jump")
		shape_normal.disabled = false
		shape_slide.disabled = true
	elif(MegaMan.moving == true):
		if(Input.is_action_pressed("Player2Slide")):
			animator.play("Slide")
			shape_normal.disabled = true
			shape_slide.disabled = false
		else:
			animator.play("Walk")
			shape_normal.disabled = false
			shape_slide.disabled = true
	else:
		animator.play("Idle")
		shape_normal.disabled = false
		shape_slide.disabled = true
	if(MegaMan.direct > 0):
		sprite.flip_h = true
	elif(MegaMan.direct < 0):
		sprite.flip_h = false

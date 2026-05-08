extends Node2D

@export var animator : AnimationPlayer
@export var player : Player_Controller2
@export var sprite : Sprite2D
@export var shape_normal : CollisionShape2D
@export var shape_slide : CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func slide_check():
	if(player.player == 2):
		if Input.is_action_just_pressed("Player2Slide"):
			return true
		else:
			return false
	else:
		if Input.is_action_just_pressed("Player1Crouch"):
			return true
		else:
			return false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(player.velocity.y < 0.0):
		animator.play("Jump")
		shape_normal.disabled = false
		shape_slide.disabled = true 
	elif(player.velocity.y > 0.0):
		animator.play("Jump")
		shape_normal.disabled = false
		shape_slide.disabled = true
	elif(player.moving == true):
		if(slide_check()):
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
	if(player.direct > 0):
		sprite.flip_h = true
	elif(player.direct < 0):
		sprite.flip_h = false

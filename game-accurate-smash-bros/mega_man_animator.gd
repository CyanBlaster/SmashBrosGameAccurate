extends Node2D

@export var animator : AnimationPlayer
@export var player_controller : Player_Controller2
@export var sprite : Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(player_controller.velocity.y < 0.0):
		animator.play("Jump")
	elif(player_controller.velocity.y > 0.0):
		animator.play("Jump")
	elif(MegaMan.moving == true):
		animator.play("Walk")
	else:
		animator.play("Idle")
	if(MegaMan.direct > 0):
		sprite.flip_h = true
	elif(MegaMan.direct < 0):
		sprite.flip_h = false

extends Node2D

@export var animator : AnimationPlayer
@export var player_controller : Player_Controller
@export var sprite : Sprite2D
@export var collision : CollisionShape2D
@export var collision2 : CollisionShape2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(player_controller.velocity.y < 0.0):
		animator.play("Jump")
		collision2.disabled = false
		collision.disabled = true
	elif(player_controller.velocity.y > 0.0):
		animator.play("Jump")
		collision2.disabled = false
		collision.disabled = true
	elif(Input.is_action_pressed("Player1Crouch") && player_controller.velocity.x != 0):
		animator.play("Jump")
		collision2.disabled = false
		collision.disabled = true
	elif(Sonic.moving == true):
		animator.play("Walk")
		collision2.disabled = true
		collision.disabled = false
	elif(Input.is_action_pressed("Player1LookUp")):
		animator.play("Look_Up")
		collision2.disabled = true
		collision.disabled = false
	elif(Input.is_action_pressed("Player1Crouch") && player_controller.velocity.x == 0):
		animator.play("Crouch")
		collision2.disabled = false
		collision.disabled = true
	
	else:
		animator.play("Idle")
		collision2.disabled = true
		collision.disabled = false
	if(Sonic.direct > 0):
		sprite.flip_h = false
	elif(Sonic.direct < 0):
		sprite.flip_h = true
	

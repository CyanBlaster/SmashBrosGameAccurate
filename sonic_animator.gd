extends Node2D

@export var animator : AnimationPlayer
@export var sonic : Player_Controller
@export var sprite : Sprite2D
@export var collision : CollisionShape2D
@export var collision2 : CollisionShape2D
#@export var player = 1
# Called when the node enters the scene tree for the first time.

func crouch_check():
	if sonic.player == 1:
		if(Input.is_action_pressed("Player1Crouch")):
			print("Crouch:1")
			return true
		else: 
			return false
	else:
		if(Input.is_action_pressed("Player2Slide")):
			print("Crouch:2")
			return true
		else: 
			return false
			
func jump_check():
	if sonic.player == 1:
		if(Input.is_action_just_pressed("Player1Jump")):
			return true
		else: 
			return false
	else:
		if(Input.is_action_just_pressed("Player2Switch")):
			return true
		else: 
			return false
func spindash_check():
	if sonic.player == 1:
		if(Input.is_action_pressed("Player1Jump")):
			return true
		else: 
			return false
	else:
		if(Input.is_action_pressed("Player2Switch")):
			return true
		else: 
			return false
func up_check():
	if sonic.player == 1:
		if(Input.is_action_pressed("Player1LookUp")):
			return true
		else: 
			return false
	else:
		if(Input.is_action_pressed("Player2Jump")):
			return true
		else:  
			return false
 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(sonic.velocity.y < 0.0):
		animator.play("Jump")
		collision2.disabled = false
		collision.disabled = true
	elif(sonic.velocity.y > 0.0):
		animator.play("Jump")
		collision2.disabled = false
		collision.disabled = true
	elif(crouch_check() && sonic.velocity.x != 0):
		animator.play("Jump")
		collision2.disabled = false
		collision.disabled = true
	elif(sonic.moving == true):
		if(sonic.max_speed):
			animator.play("Run")
		else:
			animator.play("Walk")
		collision2.disabled = true
		collision.disabled = false
	elif(up_check()):
		animator.play("Look_Up")
		collision2.disabled = true
		collision.disabled = false
	elif(crouch_check() && sonic.velocity.x == 0):
		if(spindash_check()):
			animator.play("Spindash")
		else:
			animator.play("Crouch")
			collision2.disabled = false
			collision.disabled = true
	
	else:
		animator.play("Idle") 
		collision2.disabled = true
		collision.disabled = false
	if(sonic.direct > 0):
		sprite.flip_h = false
	elif(sonic.direct < 0):
		sprite.flip_h = true 
	

extends Node2D

@export var animator : AnimationPlayer
@export var mario : CharacterBody2D
@export var sprite : Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(mario.velocity.y < 0.0):
		if(mario.speed_multi != 1):
			if(mario.powerup == 1):
				animator.play("Run_Fire_Jump")
			elif(mario.powerup == -1):
				animator.play("Run_Small_Jump")
			else:
				animator.play("Run_Jump")
		else:
			if(mario.powerup == 1):
				animator.play("Fire_Jump")
			elif(mario.powerup == -1):
				animator.play("Small_Jump")
			else:
				animator.play("Jump") 
	elif(mario.velocity.y > 0.0):
		if(mario.speed_multi != 1):
			if(mario.powerup == 1):
				animator.play("Run_Fire_Jump")
			elif(mario.powerup == -1):
				animator.play("Run_Small_Jump")
			else:
				animator.play("Run_Jump") 
		else:
			if(mario.powerup == 1):
				animator.play("Fire_Jump")
			elif(mario.powerup == -1):
				animator.play("Small_Jump")
			else:
				animator.play("Jump") 
	elif(mario.velocity.x != 0):
		if(mario.speed_multi != 1):
			if(mario.powerup == 1):
				animator.play("Fire_Run")
			elif(mario.powerup == -1):
				animator.play("Small_Run")
			else:
				animator.play("Run")
		else:
			if(mario.powerup == 1):
				animator.play("Fire_Walk")
			elif(mario.powerup == -1):
				animator.play("Small_Walk")
			else:
				animator.play("Walk")
	else:
		if(mario.powerup == 1):
			animator.play("Fire_Idle")
		elif(mario.powerup == -1):
			animator.play("Small_Idle")
		else:
			animator.play("Idle")
	if(mario.direct > 0):
		sprite.flip_h = false
	elif(mario.direct < 0):
		sprite.flip_h = true

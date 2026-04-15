extends CharacterBody2D
class_name Player_Controller

const SPEED = 500.0
const JUMP_VELOCITY = -550.0
@export var moving = false
@export var onfloor = true
@export var direct = 1
var spindash = false 
var peelout = false
var hold_still = false
var shield = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		if(Input.is_action_just_pressed("Player1Crouch")):
			velocity.y = - JUMP_VELOCITY
			 
	# Handle jump.
	if Input.is_action_just_pressed("Player1Jump") and !Input.is_action_pressed("Player1Crouch") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if(Input.is_action_pressed("Player1LookUp") || Input.is_action_pressed("Player1Crouch")):
		hold_still = true
	
	else:
		hold_still = false 
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Player1Left", "Player1Right")
	
	if(direction != 0):
		direct = direction
		
	

	
	
	if(!hold_still):
		
		if direction:
			velocity.x = direction * SPEED
			
			moving = true  
		else:
			if(Input.is_action_just_released("Player1Crouch") && Input.is_action_pressed("Player1Jump")):
				print("yes")
				hold_still = false
				moving = true
				velocity.x = direct * SPEED * 10
				print(velocity.x)
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
				moving = false
		if(Input.is_action_pressed("Player1Crouch")):
			if(velocity.x > 0):
				velocity.x -= delta
			elif(velocity.x < 0):
				velocity.x += delta
			else:
				velocity.x = 0 
		
		
	move_and_slide()



func _on_ball_detector_area_entered(area: Area2D) -> void:
	if(velocity.y != 0):
		velocity.y = JUMP_VELOCITY
	elif(velocity.x != 0):
		velocity.y = JUMP_VELOCITY
		velocity.x = -0.5 * velocity.x
		

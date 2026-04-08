extends CharacterBody2D
class_name Player_Controller

const SPEED = 500.0
const JUMP_VELOCITY = -550.0
@export var moving = false
@export var onfloor = true
@export var direct = 1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Player1Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
			
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Player1Left", "Player1Right")
	direct = direction
	if direction:
		velocity.x = direction * SPEED
		moving = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		moving = false

	move_and_slide()

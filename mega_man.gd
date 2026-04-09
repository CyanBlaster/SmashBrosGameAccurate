extends CharacterBody2D
class_name Player_Controller2

const SPEED = 240.0
const JUMP_VELOCITY = -500.0
@export var moving = false
@export var onfloor = true
@export var direct = 1
@export var weapon = 1
#
#@onready var Bullet = preload("res://buster.tscn")

func _process(_delta):
	if Input.is_action_just_pressed("Player2Switch"):
		if(weapon < 2):
			weapon += 1
		else:
			weapon = 1
	if Input.is_action_just_pressed("Player2Shoot"):
		#var bullet = Bullet.instantiate()
		if(weapon == 2):
			var bullet = preload("res://metal_blade.tscn").instantiate()
			bullet.position.y = position.y + 5
			bullet.direction = direct
			if(direct > 0):
				bullet.position.x = position.x + 20
			else:
				bullet.position.x = position.x - 20
			print(position.y)
			print("Bullet X: ", bullet.position.x)
			print("Bullet Y: ", bullet.position.y)
			get_parent().add_child(bullet)
		else:
			var bullet = preload("res://buster.tscn").instantiate()
			
			#var battlefield = preload("res://battlefield.tscn").instantiate()
			
			bullet.position.y = position.y + 10
			bullet.direction = direct
			if(direct > 0):
				bullet.position.x = position.x + 20
			else:
				bullet.position.x = position.x - 20
			print(position.y)
			print("Bullet X: ", bullet.position.x)
			print("Bullet Y: ", bullet.position.y)
			get_parent().add_child(bullet)
		#add_child(bullet)
 
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("Player2Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Player2Left", "Player2Right")
	if(direction != 0):
		direct = direction
	if direction:
		velocity.x = direction * SPEED
		moving = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		moving = false 
	move_and_slide()



func _on_area_2d_area_entered(_area: Area2D) -> void:
	position.x -= 100

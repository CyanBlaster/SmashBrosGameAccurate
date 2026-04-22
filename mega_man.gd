extends CharacterBody2D
class_name Player_Controller2

@export var battlefield : Node2D

const SPEED = 240.0
const JUMP_VELOCITY = -500.0
@export var moving = false
@export var onfloor = true
@export var direct = 1
@export var weapon = 1
@export var slide_speed = 400
@export var health = 24
@export var recover = 1
@export var metal_blade_energy = 8
@export var hold_still = true 

#@onready var Bullet = preload("res://buster.tscn")

func _process(delta): 
	if(health <= 0):
		battlefield.players -= 1
	if(recover > 0):
		recover -= delta
	
	if Input.is_action_just_pressed("Player2Switch"):  
		if(weapon < 2):
			weapon += 1
		else:
			weapon = 1
	if Input.is_action_just_pressed("Player2Shoot"):
		if(weapon == 2 && metal_blade_energy > 0):
			hold_still = true
			var bullet = preload("res://metal_blade.tscn").instantiate()
			bullet.position.y = position.y + 5
			bullet.direction = direct
			if(direct > 0):
				bullet.position.x = position.x + 35
			else:
				bullet.position.x = position.x - 35
			#print(position.y)
			#print("Bullet X: ", bullet.position.x)
			#print("Bullet Y: ", bullet.position.y)
			bullet.name = "blade_"
			get_parent().add_child(bullet)
			metal_blade_energy -= 1
		else:
			hold_still = false
			var bullet = preload("res://buster.tscn").instantiate()
			
			#var battlefield = preload("res://battlefield.tscn").instantiate()
			
			bullet.position.y = position.y + 10
			bullet.direction = direct
			if(direct > 0):
				bullet.position.x = position.x + 20
			else:
				bullet.position.x = position.x - 20
			#print(position.y)
			#print("Bullet X: ", bullet.position.x)
			#print("Bullet Y: ", bullet.position.y)
			bullet.name = "buster_"
			get_parent().add_child(bullet)
	else:
		hold_still = false
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	#if Input.is_action_just_released("Player2Slide"):
		#slide_speed = 100
	# Handle jump.
	if Input.is_action_just_pressed("Player2Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Player2Left", "Player2Right")
	
	
	if(direction != 0):
		direct = direction 
	if(!hold_still):
		if direction:
			if(Input.is_action_just_pressed("Player2Slide")):
				while(slide_speed > 0):
					velocity.x = direction * slide_speed
					slide_speed -= delta
				slide_speed = 400
			else:
				velocity.x = direction * SPEED
			moving = true
		else: 
			velocity.x = move_toward(velocity.x, 0, SPEED)
			moving = false 
	move_and_slide()
 


#func _on_area_2d_area_entered(_area: Area2D) -> void:
	#position.x -= 10



func _on_left_area_entered(_area: Area2D) -> void:
	position.x += 10
	if(recover <= 0):
		if(health > 1):
			health -= 1
			recover = 1
		else:
			queue_free()

func _on_right_area_entered(_area: Area2D) -> void:
	position.x -= 10
	if(recover <= 0):
		if(health > 1):
			recover = 1
			health -= 1
		else:
			queue_free()

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
@export var air_energy = 12
@export var hold_still = true 
@export var player = 2 

func _ready():
	if position.x < 600 && position.x > 200:
		player = 2
	else:
		player = 1
#@onready var Bullet = preload("res://buster.tscn")
func jump_check():
	if(player == 2):
		if Input.is_action_just_pressed("Player2Jump"):
			return true
		else:
			return false
	else:
		if Input.is_action_just_pressed("Player1LookUp"):
			return true
		else:
			return false
func slide_check():
	if(player == 2):
		if Input.is_action_just_pressed("Player2Slide"):
			return true
		else:
			return false
	else:
		if Input.is_action_just_pressed("Player1Crouch"):
			return true
		else:
			return false
func shoot_check():
	if(player == 2):
		if Input.is_action_just_pressed("Player2Shoot"):
			return true
		else:
			return false
	else:
		if Input.is_action_just_pressed("Player1Jump"):
			return true
		else:
			return false
func switch_check():
	if(player == 2):
		if Input.is_action_just_pressed("Player2Switch"):
			return true
		else:
			return false
	else:
		if Input.is_action_just_pressed("Player1Shield"):
			return true
		else:
			return false
	


func _process(delta): 
	if(health <= 0):
		battlefield.players -= 1
	if(recover > 0):
		recover -= delta
	
	if switch_check():  
		if(weapon < 3):
			weapon += 1
		else:
			weapon = 1
	if shoot_check():
		if(weapon == 3 && air_energy > 0):
			hold_still = true
			var bullet = preload("res://air_shooter.tscn").instantiate()
			bullet.position.y = position.y + 5 
			bullet.direction = direct
			if(direct > 0):
				bullet.position.x = position.x + 35
			else:
				bullet.position.x = position.x - 35
			#print(position.y)
			#print("Bullet X: ", bullet.position.x)
			#print("Bullet Y: ", bullet.position.y)
			bullet.name = "air_"
			get_tree().current_scene.add_child(bullet)
			air_energy -= 1
		elif(weapon == 2 && metal_blade_energy > 0): 
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
			get_tree().current_scene.add_child(bullet)
			metal_blade_energy -= 1
		else:
			hold_still = false
			var bullet = preload("res://buster.tscn").instantiate()
			 
			
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
			get_tree().current_scene.add_child(bullet)
	else:
		hold_still = false
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	#if Input.is_action_just_released("Player2Slide"):
		#slide_speed = 100
	# Handle jump.
	if jump_check() and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var left = ""
	var right = ""
	if(player == 2):
		left = "Player2Left"
		right = "Player2Right"
	else:
		left = "Player1Left"
		right = "Player1Right"
	
	var direction := Input.get_axis(left, right)
	
	
	if(direction != 0):
		direct = direction 
	if(!hold_still):
		if direction:
			if(slide_check()):
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
 

func _on_left_area_entered(_area: Area2D) -> void:
	position.x += 10
	if(recover <= 0):
		if(health > 1):
			health -= 1
			recover = 1
		else:
			queue_free()
			get_tree().change_scene_to_file("res://player_select.tscn")

func _on_right_area_entered(_area: Area2D) -> void:
	position.x -= 10
	if(recover <= 0):
		if(health > 1):
			recover = 1
			health -= 1
		else:
			queue_free()
			get_tree().change_scene_to_file("res://player_select.tscn")

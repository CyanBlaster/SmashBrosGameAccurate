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
var max_speed = false
var held = 0
@export var rings = 30
@export var recover = 1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if(recover > 0):
		recover -= delta
	
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
			if(max_speed == true):
				velocity.x = direction * SPEED
			else:
				velocity.x = direction * SPEED * 0.5
			held += delta
			if(held >= 0.5):
				max_speed = true
			moving = true  
		else:
			max_speed = false
			if(Input.is_action_just_released("Player1Crouch") && Input.is_action_pressed("Player1Jump")):
				print("yes")
				hold_still = false 
				moving = true
				velocity.x = direct * SPEED * 8
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
	if(velocity.y != 0 && area.name.begins_with("ring_")):
		velocity.y = JUMP_VELOCITY
	elif(velocity.x != 0): 
		velocity.y = JUMP_VELOCITY
		velocity.x = -0.5 * velocity.x
		


func _on_left_area_entered(area: Area2D) -> void:
	if(!area.name.begins_with("ring_") && !area.name.begins_with("Left") && !area.name.begins_with("Right") && !area.name.begins_with("Mega")):
		print(area.name)
		position.x += 1
		if(recover <= 0): 
			if(rings >= 3):
				rings -= 3
				recover = 1
				var ring = preload("res://rings.tscn").instantiate()
				var ring2 = preload("res://rings.tscn").instantiate()
				var ring3 = preload("res://rings.tscn").instantiate()
				ring.position.y = position.y + 5
				ring2.position.y = position.y - 45
				ring3.position.y = position.y - 95
				#ring.direction = direct
				ring.name = "ring_"
				ring.position.x = position.x + 90
				ring.velocity.x = 30
				get_tree().current_scene.add_child(ring)
				ring2.position.x = position.x + 60
				ring2.velocity.x = 30
				get_tree().current_scene.add_child(ring2)
				ring3.position.x = position.x + 30
				ring3.velocity.x = 30
				get_tree().current_scene.add_child(ring3)
			elif(rings == 2):
				rings -= 2
				recover = 1
				var ring = preload("res://rings.tscn").instantiate()
				var ring2 = preload("res://rings.tscn").instantiate()
				ring.position.y = position.y + 5
				ring2.position.y = position.y - 45
				#ring.direction = direct
				ring.name = "ring_"
				ring.position.x = position.x + 90
				ring.velocity.x = 30
				get_tree().current_scene.add_child(ring)
				ring2.position.x = position.x + 60
				ring2.velocity.x = -30
				get_tree().current_scene.add_child(ring2)
			elif(rings == 1):
				rings -= 1
				recover = 1
				var ring = preload("res://rings.tscn").instantiate()
				ring.position.y = position.y + 5
				#ring.direction = direct
				ring.name = "ring_"
				ring.position.x = position.x + 90
				ring.velocity.x = -30
				get_tree().current_scene.add_child(ring)
			else:
				queue_free()
		#print(position.y)
		#print("Bullet X: ", bullet.position.x)
		#print("Bullet Y: ", bullet.position.y)
		
		
	elif (area.name.begins_with("ring_")):
		rings += 1 


func _on_right_area_entered(area: Area2D) -> void:
	if(!area.name.begins_with("ring_") && !area.name.begins_with("Left") && !area.name.begins_with("Right") && !area.name.begins_with("Mega")):
		print(area.name)
		position.x -= 1
		if(recover <= 0):
			if(rings >= 3): 
				rings -= 3
				recover = 1
				var ring = preload("res://rings.tscn").instantiate()
				var ring2 = preload("res://rings.tscn").instantiate()
				var ring3 = preload("res://rings.tscn").instantiate()
				ring.position.y = position.y + 5
				ring2.position.y = position.y - 45
				ring3.position.y = position.y - 95
				#ring.direction = direct
				ring.name = "ring_"
				ring.position.x = position.x - 90
				ring.velocity.x = -30
				get_tree().current_scene.add_child(ring)
				ring2.position.x = position.x - 60
				ring2.velocity.x = -30
				get_tree().current_scene.add_child(ring2)
				ring3.position.x = position.x - 30
				ring3.velocity.x = -30
				get_tree().current_scene.add_child(ring3)
			elif(rings == 2):
				rings -= 2
				recover = 1
				var ring = preload("res://rings.tscn").instantiate()
				var ring2 = preload("res://rings.tscn").instantiate()
				ring.position.y = position.y + 5
				ring2.position.y = position.y - 45
				#ring.direction = direct
				ring.name = "ring_"
				ring.position.x = position.x - 90
				ring.velocity.x = -30
				get_tree().current_scene.add_child(ring)
				ring2.position.x = position.x - 60
				ring2.velocity.x = -30
				get_tree().current_scene.add_child(ring2)
			elif(rings == 1):
				rings -= 1
				recover = 1
				var ring = preload("res://rings.tscn").instantiate()
				ring.position.y = position.y + 5
				#ring.direction = direct
				ring.name = "ring_"
				ring.position.x = position.x - 90
				ring.velocity.x = -30
				get_tree().current_scene.add_child(ring)
			else:
				queue_free()
	elif (area.name.begins_with("ring_")):
		rings += 1

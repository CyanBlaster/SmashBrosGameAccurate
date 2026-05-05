extends CharacterBody2D

@export var battlefield : Node2D

var SPEED = 300.0
const JUMP_VELOCITY = -600.0
@export var moving = false
@export var onfloor = true
@export var direct = 1
@export var weapon = 1
@export var recover = 1
@export var speed_multi = 1
@export var powerup = 0
@export var player = 2

func jump_check():
	if(player == 2):
		if Input.is_action_just_pressed("Player2Jump"):
			return true
		else:
			return false
	else:
		if Input.is_action_just_pressed("Player1Jump"):
			return true
		else:
			return false
func fireball_check():
	if(player == 2):
		if Input.is_action_just_pressed("Player2Sprint"):
			return true
		else:
			return false
	else:
		if Input.is_action_just_pressed("Player1Shield"):
			return true
		else:
			return false
func sprint_check():
	if(player == 2):
		if Input.is_action_pressed("Player2Sprint"):
			return true
		else:
			return false
	else:
		if Input.is_action_pressed("Player1Shield"):
			return true
		else:
			return false
		

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if(recover > 0):
		recover -= delta

	# Handle jump.
	if jump_check() and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if fireball_check() && powerup == 1:
		var bullet = preload("res://fireball.tscn").instantiate()
		bullet.position.y = position.y + 5
		bullet.direction = direct
		bullet.velocity.x = direct * 300
		if(direct > 0):
			bullet.position.x = position.x + 25
		else:
			bullet.position.x = position.x - 25
		#print(position.y)
		#print("Bullet X: ", bullet.position.x)
		#print("Bullet Y: ", bullet.position.y)
		bullet.name = "fireball_"
		get_tree().current_scene.add_child(bullet)
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
	#print("Direction: ", direction)
	
	if(direction != 0):
		direct = direction 
	if direction != 0:
		if(sprint_check()):
			speed_multi = 2
			print("run")
		else:
			speed_multi = 1
			print("walk")
		velocity.x = direction * SPEED * speed_multi
		
	else:
		velocity.x = 0
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#moving = false
	#print(direct)
	move_and_slide()
 


func _on_left_area_entered(area: Area2D) -> void:
	if(recover <= 0 && !area.name.begins_with("ring")):
		if(powerup == -1):
			queue_free()
		elif(powerup == 0):
			powerup = -1 
		elif(powerup != - 1 && powerup != 0):
			recover = 1
			powerup = 0
		recover = 1


func _on_right_area_entered(area: Area2D) -> void:
	if(recover <= 0 && !area.name.begins_with("ring")):
		if(powerup != - 1 && powerup != 0):
			recover = 1
			powerup = 0
		elif(powerup == -1):
			queue_free() 
		elif(powerup == 0):
			powerup = -1
		recover = 1

extends Node2D
@export var players = 2
var player1 = Player_Select.player1
var player2 = Player_Select.player2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(player1)
	print(player2)
	if(player1 == 1):
		var bullet = preload("res://mario.tscn").instantiate()
		bullet.position.y = 300
		bullet.position.x = 400
		get_tree().current_scene.add_child(bullet)
	elif(player1 == 3):
		var bullet = preload("res://Mega_Man.tscn").instantiate()
		bullet.position.y = 300
		bullet.position.x = 400
		get_tree().current_scene.add_child(bullet)
	elif(player1 == 4):
		var bullet = preload("res://Sonic.tscn").instantiate()
		bullet.position.y = 300
		bullet.position.x = 400
		get_tree().current_scene.add_child(bullet)
	if(player2 == 1):
		var bullet = preload("res://mario.tscn").instantiate()
		bullet.position.y = 300
		bullet.position.x = 800
		get_tree().current_scene.add_child(bullet)
	elif(player2 == 3):
		var bullet = preload("res://Mega_Man.tscn").instantiate()
		bullet.position.y = 300
		bullet.position.x = 800
		get_tree().current_scene.add_child(bullet)
	elif(player2 == 4):
		var bullet = preload("res://Sonic.tscn").instantiate()
		bullet.position.y = 300
		bullet.position.x = 800
		get_tree().current_scene.add_child(bullet)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

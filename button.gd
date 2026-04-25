extends Button
@export var selection : Node2D

func _process(_delta: float) -> void:
	if(selection.game_start):
		show()
	else:
		hide()

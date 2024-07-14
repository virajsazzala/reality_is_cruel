class_name InputComponent
extends Node

var input_key: Vector2

func _process(_delta: float) -> void:
	input_key = Input.get_vector("move_left", "move_right", "move_away", "move_toward")

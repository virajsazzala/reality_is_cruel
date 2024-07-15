class_name AnimationComponent
extends Node

@export_subgroup("Nodes")
@export var sprite: AnimatedSprite2D

var last_move_direction: Vector2

func handle_horizontal_flip(move_direction: Vector2) -> void:
	if move_direction.x == 0:
		return
		
	sprite.flip_h = false if move_direction.x > 0 else true

func handle_animation(onTp: bool, move_direction: Vector2, direction: float) -> void:
	if onTp:
		handle_tp_animation(direction)
	else:
		handle_move_animation(move_direction)
		
func handle_move_animation(move_direction: Vector2) -> void:
		handle_horizontal_flip(move_direction)
		
		if move_direction.x != 0:
			last_move_direction.x = move_direction.x
			last_move_direction.y = 0
			sprite.play("run_horizontal")
		elif move_direction.y > 0:
			last_move_direction.y = move_direction.y
			last_move_direction.x = 0
			sprite.play("run_toward")
		elif move_direction.y < 0:
			last_move_direction.y = move_direction.y
			last_move_direction.x = 0
			sprite.play("run_away")
		else:
			if last_move_direction.x != 0:
				sprite.play("idle_horizontal")
			elif last_move_direction.y < 0:
				sprite.play("idle_away")
			else:
				sprite.play("idle_toward")

func handle_tp_animation(direction: float) -> void:
	if direction > 0:
		sprite.play("idle_away")
	else:
		sprite.play("idle_toward")

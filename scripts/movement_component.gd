class_name MovementComponent
extends Node

@export_subgroup("Settings")
@export var speed: float = 100
@export var ground_accel_speed: float = 8.0
@export var ground_decel_speed: float = 8.0

# x.-1 is left, x.1 is right | y.-1 is up, y.1 is down
func handle_horizontal_movement(body: CharacterBody2D, direction: Vector2) -> void:
	var velocity_change_speed: float = 0.0
	velocity_change_speed = ground_accel_speed if direction.x != 0 else ground_decel_speed
	body.velocity.x = move_toward(body.velocity.x, direction.x * speed, velocity_change_speed)
	
	
func handle_vertical_movement(body: CharacterBody2D, direction: Vector2) -> void:
	var velocity_change_speed: float = 0.0
	velocity_change_speed = ground_accel_speed if direction.y != 0 else ground_decel_speed
	body.velocity.y = move_toward(body.velocity.y, direction.y * speed, velocity_change_speed)


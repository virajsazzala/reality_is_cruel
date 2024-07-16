class_name MovementComponent
extends Node

@export_subgroup("Settings")
@export var speed: float = 70

# x.-1 is left, x.1 is right | y.-1 is up, y.1 is down
func handle_horizontal_movement(body: CharacterBody2D, direction: Vector2) -> void:
	body.velocity.x = direction.x * speed
	
	
func handle_vertical_movement(body: CharacterBody2D, direction: Vector2) -> void:
	body.velocity.y = direction.y * speed


extends CharacterBody2D

@export_subgroup("Nodes")
@export var input_component: InputComponent
@export var movement_component: MovementComponent
@export var animation_component: AnimationComponent

func _physics_process(delta: float) -> void:
	movement_component.handle_horizontal_movement(self, input_component.input_key)
	movement_component.handle_vertical_movement(self, input_component.input_key)
	animation_component.handle_move_animation(input_component.input_key)
	
	move_and_slide()

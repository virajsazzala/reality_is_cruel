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

func move_player(pos: Vector2, direction: Vector2) -> void:
	self.velocity.x = 0
	self.velocity.y = 0
	
	if direction.y == 1:
		self.position.y = pos.y + 20
	elif direction.y == -1:
		self.position.y = pos.y - 20
	else:
		self.position.y = pos.y
		
	if direction.x == 1:
		self.position.x = pos.x + 20
	elif direction.x == -1:
		self.position.x = pos.x - 20
	else:
		self.position.x = pos.x
	
func get_player_pos() -> Vector2:
	return Vector2(int(self.position.x), int(self.position.y))
	

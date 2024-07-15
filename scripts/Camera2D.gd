extends Camera2D


func move_camera(pos: Vector2) -> void:
	self.position.x = pos.x
	self.position.y = pos.y

func get_camera_pos() -> Vector2:
	return Vector2(int(self.position.x), int(self.position.y))

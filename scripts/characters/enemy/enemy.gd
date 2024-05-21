class_name Enemy
extends Character

func rotate_model_to_position(destination: Vector3) -> void:
	var direction = global_position.direction_to(destination)
	facing_angle = Vector2(direction.z, direction.x).angle()
	model.rotation.y = facing_angle

class_name Enemy
extends Character


func _ready() -> void:
	super()
	hurtbox.area_entered.connect(_on_area_entered)


func rotate_model_to_position(destination: Vector3) -> void:
	var direction: Vector3 = global_position.direction_to(destination)
	facing_angle = Vector2(direction.z, direction.x).angle()
	model.rotation.y = facing_angle


func _on_area_entered(area: Area3D) -> void:
	if not area.has_method("can_stun"):
		return
		
	if area.can_stun() and get_stat_resource(StatResource.Stat.Health).stat_value > 0:
		state_machine.switch_state(EnemyStunState)

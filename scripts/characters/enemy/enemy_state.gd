class_name EnemyState
extends CharacterState

var destination: Vector3

func _ready() -> void:
	super()
	character.get_stat_resource(StatResource.Stat.Health).depleted.connect(_on_zero_health)
	
func get_point_global_position(index: int) -> Vector3:
	var local_position: Vector3 = character.path.curve.get_point_position(index)
	var global_position: Vector3 = character.path.global_position
	return local_position + global_position

func move() -> void:
	character.agent.get_next_path_position()
	var velocity = character.global_position.direction_to(destination)
	character.velocity.x = velocity.x
	character.velocity.z = velocity.z

func on_chase_area_body_entered(_body: Node3D) -> void:
	character.state_machine.switch_state(EnemyChaseState)

func _on_zero_health() -> void:
	character.state_machine.switch_state(EnemyDeathState)
	

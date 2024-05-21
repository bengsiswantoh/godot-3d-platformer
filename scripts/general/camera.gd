extends Node3D

@export var _target: Node
@export var _position_from_target: Vector3

func _ready() -> void:
	pass

func _on_start_game() -> void:
	reparent(_target)
	position = _position_from_target

func _on_end_game() -> void:
	reparent(get_tree().current_scene)

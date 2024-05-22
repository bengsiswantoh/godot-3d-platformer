extends Node3D


@export var _target: Node
@export var _position_from_target: Vector3


func _ready() -> void:
	Events.game_started.connect(_on_game_started)
	Events.game_ended.connect(_on_game_ended)


func _on_game_started() -> void:
	reparent(_target)
	position = _position_from_target


func _on_game_ended() -> void:
	reparent(get_tree().current_scene)

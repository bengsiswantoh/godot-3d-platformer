extends Node
class_name CharacterState

var character:Character

func _ready() -> void:
	character = owner

func enter_state() -> void:
	pass

func exit_state() -> void:
	pass

func physics_process(delta: float) -> void:
	pass

func input(event: InputEvent) -> void:
	pass

class_name CharacterState
extends Node

var character:Character

func _ready() -> void:
	character = owner
	set_state(false)
	
func enter_state() -> void:
	set_state(true)
	
func exit_state() -> void:
	set_state(false)

func set_state(flag: bool) -> void:
	set_physics_process(flag)
	set_process_input(flag)

extends Node
class_name CharacterState

var character:Character

func _ready() -> void:
	character = owner
	set_state(false)
	
func enter_state() -> void:
	set_state(true)
	
func exit_state() -> void:
	set_state(false)

func set_state(enable: bool) -> void:
	set_physics_process(enable)
	set_process_input(enable)

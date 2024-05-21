extends Node
class_name StateMachine

@export var _current_state: Node
@export var _states: Array[Node]

func _ready() -> void:
	_current_state.enter_state()

func switch_state(state_to_change):
	var new_state: Node
	for state in _states:
		if state.get_script() == state_to_change:
			new_state = state
			break
			
	if !new_state:
		return
	
	if _current_state.get_script() == state_to_change:
		return
	
	_current_state.exit_state()
	_current_state = new_state
	_current_state.enter_state()
	

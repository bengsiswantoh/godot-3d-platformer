class_name StateMachine
extends Node


@export var _current_state: Node


var _states: Array[Node]


func _ready() -> void:
	#await owner.ready	
	_states = get_children()
	_current_state.enter_state()


func switch_state(state_to_change):
	var new_state: CharacterState
	for state in _states:
		if state.get_script() == state_to_change:
			new_state = state
			break
			
	if not new_state:
		return
	
	if _current_state.get_script() == state_to_change:
		return
		
	if not _current_state.can_transition():
		return
	
	_current_state.exit_state()
	_current_state = new_state
	_current_state.enter_state()
	

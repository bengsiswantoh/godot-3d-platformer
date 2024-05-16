extends Character
class_name Enemy

func physics_process(delta: float) -> void:
	state_machine.physics_process(delta)
	

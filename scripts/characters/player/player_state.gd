extends CharacterState
class_name PlayerState

func check_for_attack_input() -> void:
	if (Input.is_action_just_pressed(GameConstants.INPUT_P1_ATTACK)):
		character.state_machine.switch_state(PlayerAttackState)

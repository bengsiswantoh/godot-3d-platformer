extends CharacterState
class_name PlayerState

func _ready() -> void:
	super()
	character.get_stat_resource(StatResource.Stat.Health).on_zero.connect(_handle_zero_health)

func _handle_zero_health() -> void:
	character.state_machine.switch_state(PlayerDeathState)

func check_for_attack_input() -> void:
	if (Input.is_action_just_pressed(GameConstants.INPUT_P1_ATTACK)):
		character.state_machine.switch_state(PlayerAttackState)

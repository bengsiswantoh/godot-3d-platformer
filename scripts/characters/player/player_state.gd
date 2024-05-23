class_name PlayerState
extends CharacterState

var character: Player

func _ready() -> void:
	super()
	character = owner
	character.get_stat_resource(StatResource.Stat.Health).depleted.connect(_on_zero_health)


func check_for_attack_input() -> void:
	if (Input.is_action_just_pressed(character.input.attack)):
		character.state_machine.switch_state(PlayerAttackState)


func _on_zero_health() -> void:
	character.state_machine.switch_state(PlayerDeathState)

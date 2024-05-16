extends PlayerState
class_name PlayerMoveState

func physics_process(delta: float) -> void:
	if (not character.direction):
		character.state_machine.switch_state(PlayerIdleState)
		
	character.update_velocity_based_on_direction()

func enter_state() -> void:
	character.animation_player.play(GameConstants.ANIM_MOVE)

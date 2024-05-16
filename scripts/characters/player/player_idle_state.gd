extends PlayerState
class_name PlayerIdleState

func physics_process(delta: float) -> void:
	if (character.direction):
		character.state_machine.switch_state(PlayerMoveState)
		
func enter_state() -> void:
	character.animation_player.play(GameConstants.ANIM_IDLE)

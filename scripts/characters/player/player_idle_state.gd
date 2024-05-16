extends PlayerState
class_name PlayerIdleState

func _physics_process(delta: float) -> void:
	if (character.direction):
		character.state_machine.switch_state(PlayerMoveState)
		
func enter_state() -> void:
	super()
	character.animation_player.play(GameConstants.ANIM_IDLE)
	

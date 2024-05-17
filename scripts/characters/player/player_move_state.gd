extends PlayerState
class_name PlayerMoveState

func _physics_process(delta: float) -> void:
	if (not character.direction):
		character.state_machine.switch_state(PlayerIdleState)
		
	character.update_velocity_based_on_direction()
	#character.move_and_slide()
	#character.rotate_model(delta)

func enter_state() -> void:
	super()
	character.animation_player.play(GameConstants.ANIM_MOVE)

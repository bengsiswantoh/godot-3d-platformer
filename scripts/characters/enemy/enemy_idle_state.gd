extends EnemyState
class_name EnemyIdleState

func physics_process(delta: float) -> void:
	pass
		
func enter_state() -> void:
	character.animation_player.play(GameConstants.ANIM_IDLE)

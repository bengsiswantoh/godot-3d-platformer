extends EnemyState
class_name EnemyIdleState

func enter_state() -> void:
	super()
	character.animation_player.play(GameConstants.ANIM_IDLE)

extends EnemyState
class_name EnemyAttackState

func enter_state() -> void:
	super()
	character.animation_player.play(GameConstants.ANIM_ATTACK[0])
	

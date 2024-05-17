extends EnemyState
class_name EnemyIdleState

func _physics_process(_delta: float) -> void:
	character.state_machine.switch_state(EnemyReturnState)

func enter_state() -> void:
	super()
	character.animation_player.play(GameConstants.ANIM_IDLE)
	
	character.chase_area.body_entered.connect(handle_chase_area_body_entered)
	
func exit_state() -> void:
	super()
	character.chase_area.body_entered.disconnect(handle_chase_area_body_entered)

class_name EnemyIdleState
extends EnemyState


func _physics_process(_delta: float) -> void:
	character.state_machine.switch_state(EnemyReturnState)


func enter_state() -> void:
	super()
	character.stop_moving()
	character.animation_player.play(GameConstants.ANIM_IDLE)
	
	character.chase_area.body_entered.connect(on_chase_area_body_entered)

	
func exit_state() -> void:
	super()
	character.chase_area.body_entered.disconnect(on_chase_area_body_entered)

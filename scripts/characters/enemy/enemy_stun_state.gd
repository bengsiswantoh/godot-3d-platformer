class_name EnemyStunState
extends EnemyState


func enter_state() -> void:
	super()
	character.stop_moving()
	character.animation_player.play(GameConstants.ANIM_HIT)
	
	character.animation_player.animation_finished.connect(_on_animation_finished)

	
func exit_state() -> void:
	super()
	character.animation_player.animation_finished.disconnect(_on_animation_finished)


func _on_animation_finished(_animation_name: String) -> void:
	if character.attack_area.has_overlapping_bodies():
		character.state_machine.switch_state(EnemyAttackState)
	elif character.chase_area.has_overlapping_bodies():
		character.state_machine.switch_state(EnemyChaseState)
	else:
		character.state_machine.switch_state(EnemyIdleState)

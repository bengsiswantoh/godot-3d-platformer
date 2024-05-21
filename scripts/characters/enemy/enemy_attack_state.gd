class_name EnemyAttackState
extends EnemyState

@export var _attack_timer: Timer

var _target_position: Vector3
	
func enter_state() -> void:
	super()
	character.stop_moving()
	character.animation_player.play(GameConstants.ANIM_ATTACK[0])
	
	var target: Node3D = _get_target()
	_target_position = target.global_position
	
	character.animation_player.animation_finished.connect(_on_animation_finished)
	
	_attack_timer.timeout.connect(_on_timeout)
	_attack_timer.start()
	
func exit_state() -> void:
	super()
	character.animation_player.animation_finished.disconnect(_on_animation_finished)
	_attack_timer.timeout.disconnect(_on_timeout)
	
func _get_target() -> Node3D:
	var targets := character.attack_area.get_overlapping_bodies()
	
	if targets.is_empty():
		return null
	
	return targets[0]

func _perform_hit() -> void:
	character.set_disable_hitbox(false)
	character.hitbox.global_position = _target_position
	
func _on_animation_finished(_animation_name: String) -> void:
	character.set_disable_hitbox(true)
	
	var target = _get_target()
	
	if not target:
		var chase_targets := character.chase_area.get_overlapping_bodies()
		
		if chase_targets.is_empty():
			character.state_machine.switch_state(EnemyReturnState)
			return
		
		character.state_machine.switch_state(EnemyChaseState)
		return
		
	character.animation_player.play(GameConstants.ANIM_ATTACK[0])
	
	_target_position = target.global_position
	character.rotate_model_to_position(_target_position)
	
	_attack_timer.start()
		
# TODO call this is animation player
func _on_timeout() -> void:
	_perform_hit()

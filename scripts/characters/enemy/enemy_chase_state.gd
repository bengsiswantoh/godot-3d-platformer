class_name EnemyChaseState
extends EnemyState


@export var _chase_timer: Timer


var _target: CharacterBody3D


func _physics_process(_delta: float) -> void:	
	move()
	
	
func enter_state() -> void:
	super()
	character.animation_player.play(GameConstants.ANIM_MOVE)
	_target = character.chase_area.get_overlapping_bodies()[0]
	
	_chase_timer.timeout.connect(_on_timeout)
	character.attack_area.body_entered.connect(_on_attack_area_body_entered)
	character.chase_area.body_exited.connect(_on_chase_area_body_exited)
	
	
func exit_state() -> void:
	super()
	_chase_timer.timeout.disconnect(_on_timeout)
	character.attack_area.body_entered.disconnect(_on_attack_area_body_entered)
	character.chase_area.body_exited.disconnect(_on_chase_area_body_exited)
	
	
func _on_timeout() -> void:
	destination = _target.global_position
	character.agent.target_position = destination


func _on_attack_area_body_entered(_body: Node3D) -> void:
	character.state_machine.switch_state(EnemyAttackState)
	
	
func _on_chase_area_body_exited(_body: Node3D) -> void:
	character.state_machine.switch_state(EnemyReturnState)

extends EnemyState
class_name EnemyChaseState

@export var _chase_timer: Timer

var _target: CharacterBody3D

func _physics_process(_delta: float) -> void:	
	move()
	
func _handle_timeout() -> void:
	destination = _target.global_position
	character.agent.target_position = destination

func _handle_attack_area_body_entered(_body: Node3D) -> void:
	character.state_machine.switch_state(EnemyAttackState)
	
func _handle_chase_area_body_entered(_body: Node3D) -> void:
	character.state_machine.switch_state(EnemyReturnState)

func enter_state() -> void:
	super()
	character.animation_player.play(GameConstants.ANIM_MOVE)
	_target = character.chase_area.get_overlapping_bodies()[0]
	
	_chase_timer.timeout.connect(_handle_timeout)
	character.attack_area.body_entered.connect(_handle_attack_area_body_entered)
	character.chase_area.body_exited.connect(_handle_chase_area_body_entered)
	
func exit_state() -> void:
	super()
	_chase_timer.timeout.disconnect(_handle_timeout)
	character.attack_area.body_entered.disconnect(_handle_attack_area_body_entered)
	character.chase_area.body_exited.disconnect(_handle_chase_area_body_entered)
	

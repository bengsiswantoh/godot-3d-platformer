extends EnemyState
class_name EnemyChaseState

@export var _chase_timer: Timer

var _target: CharacterBody3D

func _physics_process(delta: float) -> void:	
	move()

func enter_state() -> void:
	super()
	character.animation_player.play(GameConstants.ANIM_MOVE)
	_target = character.chase_area.get_overlapping_bodies()[0]
	
	_chase_timer.timeout.connect(handle_timeout)
	character.attack_area.body_entered.connect(handle_attack_area_body_entered)
	character.chase_area.body_exited.connect(handle_chase_area_body_entered)
	
func exit_state() -> void:
	super()
	_chase_timer.timeout.disconnect(handle_timeout)
	character.attack_area.body_entered.disconnect(handle_attack_area_body_entered)
	character.chase_area.body_exited.connect(handle_chase_area_body_entered)
	
func handle_timeout() -> void:
	destination = _target.global_position
	character.agent.target_position = destination

func handle_attack_area_body_entered(body: Node3D) -> void:
	character.state_machine.switch_state(EnemyAttackState)
	
func handle_chase_area_body_entered(body: Node3D) -> void:
	character.state_machine.switch_state(EnemyReturnState)

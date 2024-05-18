extends EnemyState
class_name EnemyReturnState

func _ready() -> void:
	super()
	destination = get_point_global_position(0)
	
func _physics_process(_delta: float) -> void:
	if (character.agent.is_navigation_finished()):
		character.state_machine.switch_state(EnemyPatrolState)
		return
	
	move()

func enter_state() -> void:
	super()
	character.animation_player.play(GameConstants.ANIM_MOVE)
	character.agent.target_position = destination
	
	character.chase_area.body_entered.connect(handle_chase_area_body_entered)
	
func exit_state() -> void:
	super()
	character.chase_area.body_entered.disconnect(handle_chase_area_body_entered)

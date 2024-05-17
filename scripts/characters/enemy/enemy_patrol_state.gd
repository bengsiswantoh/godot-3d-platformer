extends EnemyState
class_name EnemyPatrolState

@export_range(0, 20, 0.1) var _max_idle_time: int = 4
@export var _idle_timer: Timer

var _point_index: int

func _physics_process(delta: float) -> void:
	if not _idle_timer.is_stopped():
		character.stop_moving()
		return
		
	move()

func enter_state() -> void:
	super()
	character.animation_player.play(GameConstants.ANIM_MOVE)
	
	_point_index = 1
	set_destination()
	
	character.agent.navigation_finished.connect(handle_navigation_finished)
	_idle_timer.timeout.connect(handle_timeout)
	character.chase_area.body_entered.connect(handle_chase_area_body_entered)
	
func exit_state() ->void:
	super()
	character.agent.navigation_finished.disconnect(handle_navigation_finished)
	_idle_timer.timeout.disconnect(handle_timeout)
	character.chase_area.body_entered.disconnect(handle_chase_area_body_entered)

func set_destination() -> void:
	destination = get_point_global_position(_point_index)
	character.agent.target_position = destination
	
func handle_navigation_finished() -> void:
	character.animation_player.play(GameConstants.ANIM_IDLE)
	
	var rng := RandomNumberGenerator.new()
	_idle_timer.wait_time = rng.randf_range(0, _max_idle_time)
	
	_idle_timer.start()
		
func handle_timeout() -> void:
	character.animation_player.play(GameConstants.ANIM_MOVE)
	
	_point_index = wrap(_point_index + 1, 0, character.path.curve.point_count)
	set_destination()

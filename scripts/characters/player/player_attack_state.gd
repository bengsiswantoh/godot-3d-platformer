extends PlayerState
class_name PlayerAttackState

@export var _combo_timer: Timer

var _combo_counter: int = 0
var _max_combo_count: int = 2

func _ready() -> void:
	super()
	_combo_timer.timeout.connect(func(): _combo_counter = 0)

func _perform_hit() -> void:
	pass
	
func _handle_animation_finished(_animation_name: String) -> void:
	_combo_counter += 1
	_combo_counter = wrap(_combo_counter, 0, _max_combo_count + 1)
	character.state_machine.switch_state(PlayerIdleState)

func enter_state() -> void:
	super()
	character.stop_moving()
	character.animation_player.play(GameConstants.ANIM_ATTACK[_combo_counter], -1, 1.5)
	character.animation_player.animation_finished.connect(_handle_animation_finished)
	
func exit_state() -> void:
	super()
	character.animation_player.animation_finished.disconnect(_handle_animation_finished)
	_combo_timer.start()
	

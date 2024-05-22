class_name PlayerAttackState
extends PlayerState


@export var _combo_timer: Timer
@export var _attack_timer: Timer


var _combo_counter: int = 0
var _max_combo_count: int = 2


func _ready() -> void:
	super()
	_combo_timer.timeout.connect(func(): _combo_counter = 0)
	
	
func enter_state() -> void:
	super()
	character.stop_moving()
	
	# TODO call this is animation player
	_attack_timer.timeout.connect(_on_timeout)
	_attack_timer.start()
	
	character.animation_player.play(GameConstants.ANIM_ATTACK[_combo_counter], -1, 1.5)
	character.animation_player.animation_finished.connect(_on_animation_finished)
	
	
func exit_state() -> void:
	super()
	character.animation_player.animation_finished.disconnect(_on_animation_finished)
	_attack_timer.timeout.disconnect(_on_timeout)
	
	_combo_timer.start()
	
	
func _perform_hit() -> void:
	var new_position := Vector3.BACK.rotated(Vector3.UP, character.facing_angle)
	
	var distanceMultiplier: float = 0.75;
	new_position *= distanceMultiplier;
	
	character.hitbox.position = new_position
	character.set_disable_hitbox(false)
	
	
func _on_animation_finished(_animation_name: String) -> void:
	_combo_counter += 1
	_combo_counter = wrap(_combo_counter, 0, _max_combo_count + 1)
	
	character.set_disable_hitbox(true)
	
	character.state_machine.switch_state(PlayerIdleState)
	
	
func _on_timeout() -> void:
	_perform_hit()

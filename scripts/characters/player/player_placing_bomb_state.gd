class_name PlayerPlacingBombState
extends PlayerState


@export var _bomb_scene: PackedScene


func enter_state() -> void:
	super()
	character.stop_moving()
	
	character.animation_player.play(GameConstants.ANIM_INTERACT, -1, 1.5)
	character.animation_player.animation_finished.connect(_on_animation_finished)
	
	
func exit_state() -> void:
	super()
	character.animation_player.animation_finished.disconnect(_on_animation_finished)	


func _on_animation_finished(_animation_name: String) -> void:
	var bomb = _bomb_scene.instantiate() as Node3D
	get_tree().current_scene.add_child(bomb)
	bomb.global_position = character.global_position + character.get_placing_position(1.5)
	
	character.state_machine.switch_state(PlayerIdleState)

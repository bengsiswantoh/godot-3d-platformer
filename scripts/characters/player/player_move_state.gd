class_name PlayerMoveState
extends PlayerState


func _input(_event: InputEvent) -> void:
	check_for_attack_input()
	
	if Input.is_action_just_pressed(GameConstants.INPUT_P1_INTERACT):
		character.state_machine.switch_state(PlayerPlacingBombState)


func _physics_process(_delta: float) -> void:
	if not character.direction:
		character.state_machine.switch_state(PlayerIdleState)
		
	character.update_velocity_based_on_direction()
	character.move_and_slide()
	character.rotate_model()


func enter_state() -> void:
	super()
	character.animation_player.play(GameConstants.ANIM_MOVE)

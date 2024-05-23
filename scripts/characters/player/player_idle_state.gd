class_name PlayerIdleState
extends PlayerState


func _input(_event: InputEvent) -> void:
	check_for_attack_input()
	
	if (Input.is_action_just_pressed(GameConstants.INPUT_P1_INTERACT)):
		character.state_machine.switch_state(PlayerPlacingBombState)


func _physics_process(_delta: float) -> void:
	if (character.direction):
		character.state_machine.switch_state(PlayerMoveState)
		
		
func enter_state() -> void:
	super()
	character.animation_player.play(GameConstants.ANIM_IDLE)
	

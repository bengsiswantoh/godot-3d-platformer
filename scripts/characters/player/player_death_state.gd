extends PlayerState
class_name PlayerDeathState

func _handle_animation_finished(_animation_name: String) -> void:
	character.queue_free()

func enter_state() -> void:
	super()
	character.animation_player.play(GameConstants.ANIM_DEATH)
	character.animation_player.animation_finished.connect(_handle_animation_finished)

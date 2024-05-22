class_name PlayerDeathState
extends PlayerState


func enter_state() -> void:
	super()
	character.animation_player.play(GameConstants.ANIM_DEATH)
	character.animation_player.animation_finished.connect(_on_animation_finished)


func _on_animation_finished(_animation_name: String) -> void:
	Events.game_ended.emit()
	character.queue_free()

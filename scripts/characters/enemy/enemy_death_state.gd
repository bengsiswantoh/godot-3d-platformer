class_name EnemyDeathState
extends EnemyState


func enter_state() -> void:
	super()
	character.stop_moving()
	character.animation_player.play(GameConstants.ANIM_DEATH)
	character.animation_player.animation_finished.connect(_on_animation_finished)


func _on_animation_finished(_animation_name: String) -> void:
	character.path.queue_free()

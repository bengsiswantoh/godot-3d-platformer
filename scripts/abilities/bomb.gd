class_name Bomb
extends Ability


func _ready() -> void:
	animation_player.animation_finished.connect(_on_animation_finish)
	

func _on_animation_finish(animation_name: String) -> void:
	if animation_name == GameConstants.ANIM_EXPAND:
		animation_player.play(GameConstants.ANIM_EXPLOSION)
	else:
		queue_free()

class_name Lightning
extends Ability


func _ready() -> void:
	animation_player.animation_finished.connect(_on_animation_finish)
	

func _on_animation_finish(_animation_name: String) -> void:
	queue_free()

extends Label


func _ready() -> void:
	Events.enemy_counted.connect(_on_enemy_counted)
	
	
func _on_enemy_counted(count: int) -> void:
	text = str(count)

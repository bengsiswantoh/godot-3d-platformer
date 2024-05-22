extends Node3D


func _ready() -> void:
	var total_enemies = get_child_count()
	Events.enemy_counted.emit(total_enemies)
	
	child_exiting_tree.connect(_on_child_exiting_tree)


func _on_child_exiting_tree(_node: Node) -> void:
	var total_enemies = get_child_count() - 1;
	Events.enemy_counted.emit(total_enemies)
	
	if total_enemies == 0:
		Events.victory.emit()

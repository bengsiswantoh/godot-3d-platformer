extends Node

var containers = {}

func _ready() -> void:
	for element in get_children():
		if element.get_script() == UIContainer:
			containers[element.container] = element
			
	containers[ContainerType.Start].visible = true
	containers[ContainerType.Start].button.pressed.connect(_handle_start_pressed)

func _handle_start_pressed() -> void:
	get_tree().paused = false
	containers[ContainerType.Start].visible = false
	
	#on_start_game.emit()

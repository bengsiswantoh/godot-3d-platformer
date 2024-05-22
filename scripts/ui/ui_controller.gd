extends Node


var containers = {}


var _can_pause: bool = false


func _ready() -> void:
	for element in get_children():
		if element.get_script() == UIContainer:
			containers[element.container] = element
			
	containers[UIContainer.Type.Start].visible = true
	
	containers[UIContainer.Type.Start].button.pressed.connect(_on_start_pressed)
	containers[UIContainer.Type.Pause].button.pressed.connect(_on_pause_pressed)
	
	Events.game_ended.connect(_on_game_ended)
	Events.victory.connect(_on_victory)
	

func _input(_event: InputEvent) -> void:
	if not _can_pause:
		return
	
	if not Input.is_action_just_pressed(GameConstants.INPUT_P1_PAUSE):
		return
		
	containers[UIContainer.Type.Stats].visible = get_tree().paused
	get_tree().paused = !get_tree().paused
	containers[UIContainer.Type.Pause].visible = get_tree().paused

func _on_start_pressed() -> void:
	_can_pause = true
	
	get_tree().paused = false
	
	containers[UIContainer.Type.Start].visible = false
	containers[UIContainer.Type.Stats].visible = true
	
	Events.game_started.emit()


func _on_pause_pressed() -> void:
	get_tree().paused = false
	
	containers[UIContainer.Type.Pause].visible = false
	containers[UIContainer.Type.Stats].visible = true
	

func _on_game_ended() -> void:
	_can_pause = false
	
	containers[UIContainer.Type.Stats].visible = false
	containers[UIContainer.Type.Defeat].visible = true
	
	
func _on_victory() -> void:
	_can_pause = false
	
	containers[UIContainer.Type.Stats].visible = false
	containers[UIContainer.Type.Victory].visible = true
	
	get_tree().paused = true

extends StaticBody3D


@export var _area: Area3D
@export var _icon: Sprite3D
@export var _reward: RewardResource


func _ready() -> void:
	_area.body_entered.connect(func(_body: CharacterBody3D): _icon.visible = true)
	_area.body_exited.connect(func(_body: CharacterBody3D): _icon.visible = false)
	

func _input(_event: InputEvent) -> void:
	if not _icon.visible or not Input.is_action_just_pressed(GameConstants.INPUT_P1_INTERACT):
		return
		
	_area.monitoring = false
	_icon.visible = false
	
	Events.chest_opened.emit(_reward)

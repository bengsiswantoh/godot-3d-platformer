extends Label


@export var _resource: StatResource


func _ready() -> void:
	text = str(_resource.stat_value)
	
	_resource.updated.connect(_on_updated)
		
	
func _on_updated() -> void:
	text = str(_resource.stat_value)

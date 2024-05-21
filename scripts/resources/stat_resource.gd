class_name StatResource
extends Resource

signal depleted

enum Stat {
	Health,
	Strength
}

@export var stat_type: Stat

@export var stat_value: float:
	get:
		return _stat_value
	set(value):
		_stat_value = clamp(value, 0, INF)
		if _stat_value == 0:
			depleted.emit()


var _stat_value: float

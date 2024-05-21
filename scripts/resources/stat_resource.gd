extends Resource
class_name StatResource

signal on_zero

enum Stat {
	Health,
	Strength
}

@export var stat_type: Stat

var _stat_value: float
@export var stat_value: float:
	get:
		return _stat_value
	set(value):
		_stat_value = clamp(value, 0, INF)
		if _stat_value == 0:
			on_zero.emit()


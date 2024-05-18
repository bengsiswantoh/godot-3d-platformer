extends Resource
class_name StatResource

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


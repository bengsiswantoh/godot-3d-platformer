class_name StatResource
extends Resource


signal depleted
signal updated


enum Stat {
	Health,
	Strength
}


@export var stat_type: Stat

@export var stat_value: float:
	set(value):
		stat_value = clamp(value, 0, INF)
		
		updated.emit()
		
		if stat_value == 0:
			depleted.emit()

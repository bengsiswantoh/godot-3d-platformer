class_name UIContainer
extends Container

enum Type {
	Start,
	Pause,
	Victory,
	Defeat,
	Stats,
	Reward
}

@export var container: Type
@export var button: Button

extends Area3D


@export var _weapon_bone: BoneAttachment3D
@export var _collision: CollisionShape3D


func _process(delta: float) -> void:
	_collision.global_position = _weapon_bone.global_position
	print(_weapon_bone.rotation_degrees)
	#_collision.rotation = _weapon_bone.rotation

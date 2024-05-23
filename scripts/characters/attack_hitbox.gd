class_name AttackHitbox
extends Area3D


func get_damage() -> int:
	return owner.get_stat_resource(StatResource.Stat.Strength).stat_value


func can_stun() -> bool:
	return false

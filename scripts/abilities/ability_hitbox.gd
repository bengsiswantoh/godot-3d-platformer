extends Area3D


func get_damage() -> float:
	var ability: Ability = owner
	return ability.damage


func can_stun() -> bool:
	return true

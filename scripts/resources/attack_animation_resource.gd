class_name AttackAnimationResource
extends Resource


enum Type {
	_1H,
	_2H
}


@export var type: Type


# 
var animations = {
	"_1H": [
		"1H_Melee_Attack_Chop",
		"1H_Melee_Attack_Slice_Diagonal",
		"1H_Melee_Attack_Slice_Horizontal",
		"1H_Melee_Attack_Stab"
	],
	"_2H": [
		"2H_Melee_Attack_Chop",
		"2H_Melee_Attack_Slice",
		"2H_Melee_Attack_Spin",
		"2H_Melee_Attack_Spinning",
		"2H_Melee_Attack_Stab"
	]
}

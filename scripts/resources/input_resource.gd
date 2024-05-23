class_name InputResource
extends Resource


@export_range(0, 1, 1) var player_index: int


var left: String:
	get:
		return _lefts[player_index]
var right: String:
	get:
		return _rights[player_index]
var up: String:
	get:
		return _ups[player_index]
var down: String:
	get:
		return _downs[player_index]
var pause: String:
	get:
		return _pauses[player_index]
var attack: String:
	get:
		return _attacks[player_index]
var jump: String:
	get:
		return _jumps[player_index]
var interact: String:
	get:
		return _interacts[player_index]

var _lefts: Array[String] = [
	"p1_left",
	"p2_left"
]
var _rights: Array[String] = [
	"p1_right",
	"p2_right"
]
var _ups: Array[String] = [
	"p1_up",
	"p2_up"
]
var _downs: Array[String] = [
	"p1_down",
	"p2_down"
]
var _pauses: Array[String] = [
	"p1_pause",
	"p2_pause"
]
var _attacks: Array[String] = [
	"p1_attack",
	"p2_attack"
]
var _jumps: Array[String] = [
	"p1_jump",
	"p2_jump"
]
var _interacts: Array[String] = [
	"p1_interact",
	"p2_interact"
]

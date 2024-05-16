extends CharacterBody3D
class_name Character

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

@export_range(0, 20, 0.1) var _speed := 5.0

@export_group("Required Node")
@export var animation_player: AnimationPlayer
@export var state_machine: StateMachine
@export var model: Node3D

var direction: Vector3 = Vector3.ZERO
var facing_angle: float
var rotation_speed: float = 8

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	move_and_slide()
	rotate_model(delta)

func rotate_model(delta: float) -> void:
	var is_moving = velocity.x != 0 or velocity.z != 0
		
	if is_moving:
		facing_angle = Vector2(velocity.z, velocity.x).angle()
		model.rotation.y = lerp_angle(model.rotation.y, facing_angle, rotation_speed * delta)

func physics_process(delta: float) -> void:
	pass

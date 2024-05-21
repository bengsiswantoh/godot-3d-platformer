class_name Character
extends CharacterBody3D

@export_range(0, 20, 0.1) var _speed := 5.0

@export var stats: Array[StatResource]

@export_group("Required Node")
@export var animation_player: AnimationPlayer
@export var state_machine: StateMachine
@export var model: Node3D
@export var hitbox: Area3D
@export var _hitbox_shape: CollisionShape3D
@export var _hurtbox: Area3D

@export_group("AI Node")
@export var path: Path3D
@export var agent: NavigationAgent3D
@export var chase_area: Area3D
@export var attack_area: Area3D

var facing_angle: float

var _rotation_speed: float = 8

# Get the gravity from the project settings to be synced with RigidBody nodes.
var _gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready() -> void:
	_hurtbox.area_entered.connect(_on_hurtbox_entered)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= _gravity * delta
		
	move_and_slide()
	_rotate_model(delta)

func stop_moving(speed: float = _speed) -> void:
	velocity.x = move_toward(velocity.x, 0, speed)
	velocity.z = move_toward(velocity.z, 0, speed)
	
func get_stat_resource(stat: int) -> StatResource:
	var result: StatResource
	
	for element in stats:
		if element.stat_type == stat:
			result = element
			break
	
	return result
	
func set_disable_hitbox(flag: bool) -> void:
	_hitbox_shape.disabled = flag
	
func _rotate_model(delta: float) -> void:
	var is_moving = velocity.x != 0 or velocity.z != 0
		
	if is_moving:
		facing_angle = Vector2(velocity.z, velocity.x).angle()
		model.rotation.y = lerp_angle(model.rotation.y, facing_angle, _rotation_speed * delta)
	
func _on_hurtbox_entered(area: Area3D) -> void:
	var health: StatResource = get_stat_resource(StatResource.Stat.Health)
	
	var character: Character = area.owner as Character;
	health.stat_value -= character.get_stat_resource(StatResource.Stat.Strength).stat_value
	
	print(character.name)
	print(health.stat_value)

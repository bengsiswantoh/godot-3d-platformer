class_name Character
extends CharacterBody3D

@export_range(0, 20, 0.1) var speed: float = 5
@export var stats: Array[StatResource]

@export_group("Required Node")
@export var animation_player: AnimationPlayer
@export var state_machine: StateMachine
@export var model: Node3D
@export var hurtbox: Area3D
@export var hitbox: Area3D
@export var _hitbox_shape: CollisionShape3D
@export var _head: MeshInstance3D
@export var _timer: Timer

@export_group("AI Node")
@export var path: Path3D
@export var agent: NavigationAgent3D
@export var chase_area: Area3D
@export var attack_area: Area3D


var facing_angle: float


var _shader: ShaderMaterial
#var _gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready() -> void:
	_shader = _head.material_overlay
	
	_timer.timeout.connect(_on_timeout)
	hurtbox.area_entered.connect(_on_hurtbox_entered)


func _physics_process(_delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y -= _gravity * delta
	pass
	
	
func get_stat_resource(stat: int) -> StatResource:
	var result: StatResource
	
	for element in stats:
		if element.stat_type == stat:
			result = element
			break
	
	return result
	
	
func get_placing_position(distanceMultiplier: float = 0.75) -> Vector3:
	var new_position := Vector3.BACK.rotated(Vector3.UP, facing_angle)
	new_position *= distanceMultiplier;
	return new_position


func stop_moving() -> void:
	velocity.x = move_toward(velocity.x, 0, speed)
	velocity.z = move_toward(velocity.z, 0, speed)
		
	
func set_disable_hitbox(flag: bool) -> void:
	_hitbox_shape.disabled = flag
	
	
func rotate_model() -> void:
	var is_moving: bool = velocity.x != 0 or velocity.z != 0
		
	if is_moving:
		facing_angle = Vector2(velocity.z, velocity.x).angle()
		model.rotation.y = lerp_angle(model.rotation.y, facing_angle, 0.5)
	
	
func _on_hurtbox_entered(area: Area3D) -> void:
	if not area.has_method("get_damage"):
		return
		
	var damage: float = area.get_damage()
	
	var health: StatResource = get_stat_resource(StatResource.Stat.Health)
	health.stat_value -= damage
	
	_shader.set_shader_parameter("active", true)
	_timer.start()
	#print(health.stat_value)

func _on_timeout() -> void:
	_shader.set_shader_parameter("active", false)

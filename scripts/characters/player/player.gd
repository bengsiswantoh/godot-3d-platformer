class_name Player
extends Character


const JUMP_VELOCITY = 4.5


@export var input: InputResource


var direction := Vector3.ZERO

func _ready() -> void:
	super()
	Events.chest_opened.connect(_on_chest_opened)


func _input(_event: InputEvent) -> void:
	# Get the input direction and handle the movement/deceleration.
	var input_dir: Vector2 = Input.get_vector(
		input.left, 
		input.right, 
		input.up, 
		input.down)
		
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()


#func _physics_process(delta: float) -> void:
	# Handle jump.
	#if Input.is_action_just_pressed(GameConstants.INPUT_P1_JUMP) and is_on_floor():
		#velocity.y = JUMP_VELOCITY
		#
	#super(delta)
	
	
func update_velocity_based_on_direction() -> void:
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		stop_moving()


func rotate_model() -> void:
	var is_moving: bool = direction.x != 0 or direction.z != 0
		
	if is_moving:
		facing_angle = Vector2(direction.z, direction.x).angle()
		model.rotation.y = lerp_angle(model.rotation.y, facing_angle, 0.5)


func _on_chest_opened(reward: RewardResource) -> void:
	var stat = get_stat_resource(reward.target_stat.stat_type)
	stat.stat_value += reward.target_stat.stat_value

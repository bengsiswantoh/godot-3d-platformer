extends Character
class_name Player

const JUMP_VELOCITY = 4.5

func _input(event: InputEvent) -> void:
	# Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector(
		GameConstants.INPUT_P1_LEFT, 
		GameConstants.INPUT_P1_RIGHT, 
		GameConstants.INPUT_P1_UP, 
		GameConstants.INPUT_P1_DOWN)
		
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	state_machine.input(event)

func physics_process(delta: float) -> void:
	# Handle jump.
	if Input.is_action_just_pressed(GameConstants.INPUT_P1_JUMP) and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	state_machine.physics_process(delta)

func update_velocity_based_on_direction(speed: float = _speed) -> void:
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

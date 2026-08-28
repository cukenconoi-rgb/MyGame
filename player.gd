extends CharacterBody3D

@export var speed := 5.0
@export var gravity := 20.0

func _physics_process(delta):
	var input_dir = Input.get_vector(
		"move_left",
		"move_right",
		"move_forward",
		"move_back"
	)

	var direction = Vector3(
		input_dir.x,
		0,
		input_dir.y
	)

	if direction.length() > 0:
		direction = direction.normalized()

	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y = 0

	move_and_slide()

extends CharacterBody2D

var direction: float
@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
signal shoot(pos: Vector2, dir: Vector2)


func _physics_process(delta: float) -> void:
	#	重力
	if not is_on_floor():
		velocity += get_gravity() * delta
	move()
	move_and_slide()

	shooting()


func shooting():
	if Input.is_action_pressed("shoot") and $ReloadTimer.is_stopped():
		shoot.emit(position, get_local_mouse_position().normalized())
		$ReloadTimer.start()


func move():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 20)

	animation()


func animation():
	if direction != 0:
		$Legs.flip_h = direction < 0
	if is_on_floor():
		$LegsAnimationPlayer.current_animation = "run" if direction else "idle"
	else:
		$LegsAnimationPlayer.current_animation = "jump"
	
	var raw_dir = get_local_mouse_position().normalized()
	
	
	

extends CharacterBody2D

var direction: Vector2
var speed: int = 50


func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	animated()
	move_and_slide()


func animated():
	if direction:
		if direction.y == 0:
			$AnimatedSprite2D.animation = "left" if direction.x < 0 else "right"
		else:
			$AnimatedSprite2D.animation = "up" if direction.y < 0 else "down"
	else:
		$AnimatedSprite2D.frame = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("confirm"):
		print("123")

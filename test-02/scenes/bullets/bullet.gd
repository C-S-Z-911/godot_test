extends Area2D

var direction:Vector2 = Vector2.ZERO
@export var speed :float = 500

func setup(pos: Vector2, dir: Vector2):
	position = pos + dir * 15
	direction = dir
	
func _physics_process(delta: float) -> void:
	position += direction * speed * delta

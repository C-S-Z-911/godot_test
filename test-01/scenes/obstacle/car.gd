extends Area2D

@export var direction: Vector2 = Vector2.ZERO
@export var speed: int = 200
var color = [preload("res://graphics/cars/green.png"), preload("res://graphics/cars/red.png"), preload("res://graphics/cars/yellow.png")]


func _ready() -> void:
	if position.x < 0:
		direction = Vector2.RIGHT
		$Sprite2D.flip_h = true
	$Sprite2D.texture = color.pick_random()


func _physics_process(delta: float) -> void:
	position += direction * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_timer_timeout() -> void:
	queue_free()

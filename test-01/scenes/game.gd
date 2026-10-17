extends Node2D

@export var car_scene : PackedScene = preload("res://scenes/obstacle/car.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_car_timer_timeout() -> void:
	var car: Area2D = car_scene.instantiate()
	var pos_marker:Marker2D = $CarStartPositions.get_children().pick_random()
	car.position = pos_marker.position
	$Objects.add_child(car)
	car.connect("body_entered",go_to_title)
	
func go_to_title(body: Node2D):
	print("车辆碰撞")

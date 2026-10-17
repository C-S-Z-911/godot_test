extends Node2D

@export var debug: bool = false
@export var car_scene: PackedScene = preload("res://scenes/obstacle/car.tscn")
var scorel: int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_car_timer_timeout() -> void:
	var car: Area2D = car_scene.instantiate()
	var pos_marker: Marker2D = $CarStartPositions.get_children().pick_random()
	car.position = pos_marker.position
	$Objects.add_child(car)
	car.connect("body_entered", go_to_title)


func go_to_title(_body: Node2D):
	call_deferred("change_scene")


func _on_score_timer_timeout() -> void:
	scorel += 1
	$CanvasLayer/Label.text = "得分: " + str(scorel)


func _on_finish_area_2d_body_entered(_body: Node2D) -> void:
	call_deferred("change_scene")


func change_scene():
	if debug:
		print("切换场景")
	else: 
		get_tree().change_scene_to_file("res://scenes/title.tscn")

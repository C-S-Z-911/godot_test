extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.score == -1:
		$"得分".text = "得分: []"
	else:
		$"得分".text = "得分: " + str(Global.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("confirm"):
		get_tree().change_scene_to_file("res://scenes/game.tscn")

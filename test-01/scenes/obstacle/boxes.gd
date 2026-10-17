extends StaticBody2D

@export var random_sticker: bool = false
var sticker = [preload("res://graphics/objects/box1.png"), preload("res://graphics/objects/box2.png"), preload("res://graphics/objects/box3.png")]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.texture = sticker.pick_random()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

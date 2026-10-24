extends Node2D

@export var bullet_scenes = preload("res://scenes/bullets/bullet.tscn")

func _on_player_shoot(pos: Vector2, dir: Vector2) -> void:
	var bullet:Area2D = bullet_scenes.instantiate()
	bullet.setup(pos, dir)
	$bullet.add_child(bullet)

	

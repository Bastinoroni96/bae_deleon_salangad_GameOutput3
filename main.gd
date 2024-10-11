extends Node2D

var Enemy = preload("res://enemy.tscn")


func _on_spwan_timer_timeout() -> void:
	var enemy = Enemy.instantiate()
	enemy.position = Vector2(randf_range(1200,1200),randf_range(100,500))
	add_child(enemy)

extends Area2D

@export var speed = 400

func _physics_process(delta: float) -> void:
	position.x += delta * speed
	
	

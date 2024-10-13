extends Node


var health = 3
var score = 0
var camera = null

func _ready() -> void:
	# Ensure the camera is set up at the start of the scene
	camera = get_tree().current_scene.get_node("Camera2D")  # Adjust this path as needed

func screen_shake(intensity: float, duration: float, dampening: float) -> void:
	if camera:  # Ensure the camera is assigned
		camera.screen_shake(intensity, duration, dampening)
	else:
		print("Camera not found!")

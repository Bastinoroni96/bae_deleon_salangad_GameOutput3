extends ParallaxBackground

func _process(delta: float) -> void:
	scroll_base_offset -= Vector2(300, 0) * delta

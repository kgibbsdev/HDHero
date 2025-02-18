extends RigidBody2D

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if position.y < 0:
		pass
	else:
		queue_free()

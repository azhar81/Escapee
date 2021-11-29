extends StaticBody2D

func _on_collision_batu_body_entered(body):
	if body.get_name() == "slime_batu" and body.is_falling():
		queue_free()

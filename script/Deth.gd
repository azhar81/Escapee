extends Area2D

func _on_Spike_up_body_entered(body):
	if body is Slime:
		body.dead()

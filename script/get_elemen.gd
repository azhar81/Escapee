extends Area2D

export (String) var element = "angin"

func _on_Elemen_body_entered(body):
	if body is Slime:
		if element == "angin":
			body.obtained_wind()
		elif element == "batu":
			body.obtained_rock()
		else:
			pass
		queue_free()

extends Area2D

export (String) var scene = "temp_map"

func _on_Spike_up_body_entered(body):
	if body is Slime:
#		body.dead()
		get_tree().change_scene("res://scenes/" + scene + ".tscn")

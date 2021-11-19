extends Area2D

export (String) var scene = "temp_map"




func _on_Area_Trigger_body_entered(body):
	if body is Slime:
		get_tree().change_scene("res://scenes/" + scene + ".tscn")


func _on_Area2D_body_entered(body):
		if body is Slime:
			get_tree().change_scene("res://scenes/" + scene + ".tscn")

extends Area2D

export (String) var scene = "temp_map"

func _ready():
	pass # Replace with function body.

func _on_Flag_body_entered(body):
	if body is Slime:
			get_tree().change_scene("res://scenes/" + scene + ".tscn")

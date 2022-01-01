extends Node2D

func _on_LinkButton_pressed():
	GameAudio.play()
	get_tree().change_scene("res://scenes/jump-tut.tscn")


func _on_LinkButton2_pressed():
	get_tree().quit()

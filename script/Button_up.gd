extends StaticBody2D

onready var button_down = load("res://scenes/Button_down.tscn")

func _on_Area2D_body_entered(body):
	if body is Slime:
		queue_free()
		var instance = button_down.instance()
		var pos = get_position()
		instance.set_position(pos)
		get_parent().add_child(instance)

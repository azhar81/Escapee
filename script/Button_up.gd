extends StaticBody2D

onready var button_down = load("res://scenes/Button_down.tscn")
onready var crate_small = load("res://scenes/Crate_small.tscn")
onready var crate_big = load("res://scenes/Crate_big.tscn")

func _on_Area2D_body_entered(body):
	if body is Slime:
		queue_free()
		var instance = button_down.instance()
		var pos = get_position()
		instance.set_position(pos)
		get_parent().call_deferred("add_child", instance)
		
		instance = crate_small.instance()
		instance.set_position(Vector2(386.878, 287.868))
		get_parent().call_deferred("add_child", instance)
	
		instance = crate_big.instance()
		instance.set_position(Vector2(467.191, 280.017))
		get_parent().call_deferred("add_child", instance)

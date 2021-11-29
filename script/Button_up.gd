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
		
		instance = crate_big.instance()
		instance.set_position(Vector2(572.27, 421.592))
		get_parent().call_deferred("add_child", instance)
	
		instance = crate_big.instance()
		instance.set_position(Vector2(497, 384))
		get_parent().call_deferred("add_child", instance)
		
		instance = crate_big.instance()
		instance.set_position(Vector2(670.594, 352.597))
		get_parent().call_deferred("add_child", instance)
		
		instance = crate_big.instance()
		instance.set_position(Vector2(497, 323))
		get_parent().call_deferred("add_child", instance)
		
		instance = crate_big.instance()
		instance.set_position(Vector2(440, 290))
		get_parent().call_deferred("add_child", instance)
		
		instance = crate_big.instance()
		instance.set_position(Vector2(383, 256))
		get_parent().call_deferred("add_child", instance)
		
		instance = crate_big.instance()
		instance.set_position(Vector2(336, 224))
		get_parent().call_deferred("add_child", instance)
		
		instance = crate_big.instance()
		instance.set_position(Vector2(581, 221))
		get_parent().call_deferred("add_child", instance)
		
		instance = crate_big.instance()
		instance.set_position(Vector2(581, 263))
		get_parent().call_deferred("add_child", instance)

extends KinematicBody2D

signal slam
signal transformed(slime)

class_name Slime

var speed = 200
var jump_speed = -200

const UP = Vector2(0, -1)

onready var default = {
	'name': "slime_default",
	'resource': load("res://player/slime_default.tscn")
}
onready var angin = {
	'name': "slime_angin",
	'resource': load("res://player/slime_angin.tscn")
}

onready var batu = {
	'name': "slime_batu",
	'resource': load("res://player/slime_batu.tscn")
}

var velocity = Vector2()
var input_velocity = Vector2()

func get_input():
	pass

func _process(_delta):
	pass

func change_form():
	if not is_on_floor():
		if Input.is_action_just_pressed("ui_up") and Global.has_wind:
			change_into(angin)
		
		elif Input.is_action_just_pressed("ui_down") and Global.has_rock:
			change_into(batu)
	
	if Input.is_action_just_released("ui_up"):
			change_into(default)
		
	elif Input.is_action_just_released("ui_down"):
		change_into(default)

func change_into(form):
	if form.name != get_name():
		queue_free()
		var instance = form.resource.instance()
		instance.set_position(get_position())
		instance.set_velocity(get_velocity())
		get_parent().add_child(instance)
		emit_signal("transformed", instance)

func dead():
	get_tree().reload_current_scene()

func set_velocity(vel):
	velocity = vel

func get_velocity():
	return velocity

func obtained_wind():
	Global.has_wind = true

func obtained_rock():
	Global.has_rock = true

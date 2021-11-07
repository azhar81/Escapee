extends KinematicBody2D

export (int) var speed = 100
export (int) var jump_speed = -200
export (int) var GRAVITY = 500

const UP = Vector2(0, -1)

var velocity = Vector2()

func get_input():
	velocity.x = 0
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		#$AnimatedSprite.play("jump")
		velocity.y = jump_speed
	if Input.is_action_pressed('ui_right'):
		velocity.x += speed
	if Input.is_action_pressed('ui_left'):
		velocity.x -= speed

func _process(delta):
	velocity.y += delta * GRAVITY
	if is_on_floor():
		#$AnimatedSprite.play("idle")
		velocity += get_floor_velocity()
	get_input()
	velocity = move_and_slide(velocity, UP)


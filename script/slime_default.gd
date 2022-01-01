extends Slime

export (int) var GRAVITY = 500
var acceleration = 0.1
var friction = 0.05

onready var sprite = $AnimatedSprite
onready var sfx = $AudioStreamPlayer

var was_falling = false

func _process(delta):
	velocity.y += delta * GRAVITY
	if is_on_floor():
		velocity += get_floor_velocity()
	get_input()
	change_form()
	velocity = move_and_slide(velocity, UP)
	
	if is_on_floor():
		if input_velocity == Vector2.ZERO and not was_falling:
			sprite.play("idle")
			sfx.stop()
		elif was_falling:
			sprite.play("land")
			sfx.play()
		else:
			sprite.play("move")
			sfx.play()
	
	else:
		was_falling = true
		sprite.play("jump")
		sfx.stop()

func get_input():
	input_velocity = Vector2.ZERO

	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y += jump_speed
	
	if Input.is_action_just_released("ui_up") && velocity.y < 0:
		velocity.y = 0
		
	if Input.is_action_pressed('ui_right'):
		sprite.set_flip_h(false)
		input_velocity.x += speed

	if Input.is_action_pressed('ui_left'):
		sprite.set_flip_h(true)
		input_velocity.x -= speed
	
	if input_velocity.x != 0:
		velocity.x = velocity.linear_interpolate(input_velocity, acceleration).x
	else:
		velocity.x = velocity.linear_interpolate(Vector2.ZERO, friction).x

func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "land":
		was_falling = false

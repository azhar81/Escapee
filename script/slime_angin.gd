extends Slime

onready var sprite = $AnimatedSprite
onready var sfx = $AudioStreamPlayer

var was_falling = false
var acceleration = 0.07
var friction = 0.02
var play_move_sfx = false

func _process(_delta):
	velocity.y = 20
	if is_on_floor():
		velocity += get_floor_velocity()
	get_input()
	change_form()
	velocity = move_and_slide(velocity, UP)
	
	if is_on_floor():
		set_sfx_state_to(false)
		if input_velocity == Vector2.ZERO and not was_falling:
			sprite.play("idle")
		elif was_falling:
			sprite.play("land")
		else:
			sprite.play("move")
	
	else:
		was_falling = true
		sprite.play("glide")
		set_sfx_state_to(true)

func get_input():
	input_velocity = Vector2.ZERO

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

func set_sfx_state_to(state):
	if play_move_sfx != state:
		if state:
			sfx.play()
		else:
			sfx.stop()
		play_move_sfx = state

extends Slime

onready var sprite = $AnimatedSprite

var was_falling = false

func _process(_delta):
	velocity.y = 20
	if is_on_floor():
		velocity += get_floor_velocity()
	get_input()
	change_form()
	velocity = move_and_slide(velocity, UP)
	
	if velocity == Vector2.ZERO and not was_falling:
		sprite.play("idle")
	elif velocity.y == 0 and was_falling:
		sprite.play("land")
	elif velocity.y != 0:
		was_falling = true
		sprite.play("glide")
	else:
		sprite.play("move")

func get_input():
	velocity.x = 0

	if Input.is_action_pressed('ui_right'):
		sprite.set_flip_h(false)
		velocity.x += speed

	if Input.is_action_pressed('ui_left'):
		sprite.set_flip_h(true)
		velocity.x -= speed


func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "land":
		was_falling = false

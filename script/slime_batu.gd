extends Slime

export (int) var GRAVITY = 700

onready var sprite = $AnimatedSprite

var was_falling = false

func _process(delta):
	velocity.y += delta * GRAVITY
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
		sprite.play("jump")

func get_input():
	velocity.x = 0

func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "land":
		was_falling = false

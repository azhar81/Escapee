extends Slime

export (int) var GRAVITY = 1400

onready var sprite = $AnimatedSprite
onready var sfx = $"rock slime sfx"

var was_falling = false

func _process(delta):
	velocity.y += GRAVITY * delta
	if is_on_floor():
		velocity += get_floor_velocity()
	get_input()
	change_form()
	velocity = move_and_slide(velocity, UP)
	
	if velocity == Vector2.ZERO and not was_falling:
		sprite.play("idle")
	elif velocity.y == 0 and was_falling:
		slam()
		sprite.play("land")
	elif velocity.y != 0:
		was_falling = true
		sprite.play("jump")

func get_input():
	velocity.x = 0

func is_falling():
	return was_falling

func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "land":
		was_falling = false

func slam():
	if sprite.animation != "land":
		sfx.play()
		emit_signal("slam")

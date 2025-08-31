extends CharacterBody2D


const SPEED = 1000.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer


func _physics_process(delta: float) -> void:
	
	# grabbing direction of input
	var direction:Vector2 = Input.get_vector("left", "right", "up", "down")
	
	# correctly setting velocity
	velocity = direction * (SPEED * delta)
	
	if Input.is_anything_pressed():
		# restarting the timer
		timer.start()

	# deciding on whether or not to flip the sprite
	if direction.x > 0:
		animated_sprite_2d.flip_h = true
	elif direction.x < 0:
		animated_sprite_2d.flip_h = false
		
	if not direction.is_zero_approx():
		animated_sprite_2d.play("walking")
	else:
		if timer.time_left:
			animated_sprite_2d.play("idle standing")
	
	move_and_slide()


func _on_timer_timeout() -> void:
	# upon the timer running out, we want the cat to sit down
	animated_sprite_2d.play("standing to sitting")


func _on_animated_sprite_2d_animation_finished() -> void:
	# the only non-looping animation, for now, ...
	# ... is standing to sitting, so if we know ...
	# ... that this will only be called
	animated_sprite_2d.play("idle sitting")

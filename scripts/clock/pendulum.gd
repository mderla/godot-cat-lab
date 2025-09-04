extends AnimatedSprite2D


@onready var pendulum_sound: AudioStreamPlayer2D = $"../PendulumSound"


func _ready() -> void:
	# at 1, there is one frame per second. So since we play the animation ...
	# ... twice (once forwad, once backward) we want the speed of the ...
	# ... animation to be half the duratiojn o
	speed_scale = (
		0.5 *
		sprite_frames.get_frame_count("pendulum swing") *
		pendulum_sound.stream.get_length()
	)


func _on_animation_looped() -> void:
	# flipping pendulum
	flip_h = not flip_h
	if not flip_h:
		pendulum_sound.play()

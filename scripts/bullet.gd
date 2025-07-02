### Bullet.gd ###
extends Node2D

# Seconds of a bullet
var speed = 150

# Physical process method called 60 times/second
func _physics_process(delta):
	# Move the bullet every frame by adding the current bullet position to..
	# the current bullet direction x the current bullet direction x..
	# the speed of the bullet per second x 1 frame of time

	position += Vector2.RIGHT.rotated(rotation) * speed * delta

func _on_Bullet_body_entered(body):
	# free Bullet
	queue_free()
	

func disappear_after_delay() -> void:
	await get_tree().create_timer(5).timeout
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	disappear_after_delay()

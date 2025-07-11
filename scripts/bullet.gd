### Bullet.gd ###
extends Node2D

# Seconds of a bullet
var speed = 150
var is_off_screen := false
var change
signal velchange

func _ready():
	change = randi()%5 + 10
	await get_tree().create_timer(change).timeout
	emit_signal("velchange")


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
	is_off_screen = true
	await get_tree().create_timer(15).timeout

	if is_off_screen:
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	is_off_screen = false



func set_speed(new_speed: float) -> void:
	speed = new_speed

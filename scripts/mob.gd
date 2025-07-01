extends CharacterBody2D

signal health_depleted
signal mob_died

var health = 3
var player: CharacterBody2D

func _ready() -> void:
	disappear_after_delay()

func _physics_process(delta):

	if player:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * 200.0
		move_and_slide()

func disappear_after_delay() -> void:
	await get_tree().create_timer(15).timeout
	emit_signal("mob_died")
	queue_free()

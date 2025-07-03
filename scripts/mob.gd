extends CharacterBody2D

signal health_depleted
signal mob_died
var target_position
var move = false

var health = 3
var player: CharacterBody2D

func _ready() -> void:
	$Await.start()
	if player:
		var radius = 150 
		var angle = randf() * TAU
		
		var offset = Vector2(cos(angle), sin(angle)) * radius
		
		global_position = player.global_position + offset


	disappear_after_delay()
func _physics_process(delta):

	if player && move == true:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * 300.0
		move_and_slide()

func disappear_after_delay() -> void:
	await get_tree().create_timer(15).timeout
	emit_signal("mob_died")
	queue_free()


func _on_await_timeout() -> void:
	move = true

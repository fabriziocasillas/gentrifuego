extends CharacterBody2D
var health = 3.0
signal health_depleted


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	const DAMAGE_RATE = 0.5
	velocity = direction * 700

	move_and_slide()


		
	var overlapping_bodies = $HurtBox.get_overlapping_bodies()
	if overlapping_bodies.size() > 0:
		health -= DAMAGE_RATE * overlapping_bodies.size() * delta
		%ProgressBar.value = health
		%ProgressBar.max_value = 3.0

		if health <= 0.0:
			health_depleted.emit()
			

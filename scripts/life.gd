extends ProgressBar

var player: CharacterBody2D
var direction

func _ready():
	self.max_value = 3.0
	self.value = 3.0

#	player.connect("attacked", Callable(self, "_on_player_attacked"))s

		
func _physics_process(delta):
	if player:
		direction = player.global_position
		self.value = player.health

	global_position = direction + Vector2(-50,-50)
	rotation = 0


#func _on_player_attacked(health) -> void:
#	print(health)
#	self.value = health

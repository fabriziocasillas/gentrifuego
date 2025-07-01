extends Node2D

var bullet_scene = preload("res://escenas/bullet.tscn")
var lados = 5

func _ready():
	pass
	


func _on_timer_timeout() -> void:
	for i in lados:
		var bullet = bullet_scene.instantiate()
		bullet.global_position = global_position
		
		var angle = (2 * PI / lados) * i
		bullet.rotation = angle
		get_parent().add_child(bullet)


func _on_patron_timeout() -> void:
	lados = randi() % 10 + 1

extends Node2D

var bullet_scene = preload("res://escenas/bullet.tscn")
var lados = 5

var player: CharacterBody2D

var player_position
var direction


func _ready():

	randomize()


func _on_timer_timeout() -> void:
	for i in lados:
		var bullet = bullet_scene.instantiate()
		bullet.global_position = global_position
		
		var angle = (2 * PI / lados) * i
		bullet.rotation = angle
		get_parent().add_child(bullet)


func _on_patron_timeout() -> void:
	lados = randi() % 10 + 2


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if player:
		direction = player.global_position

	var offset_x = randi() % 50 + 40
	var offset_y = randi() % 50 + 40

	if randi() % 2 == 0:
		offset_x *= -1
	if randi() % 2 == 0:
		offset_y *= -1

	global_position = direction + Vector2(offset_x, offset_y)
	print("el enemigo piensa que el player esta en player esta en ")
	print(direction)

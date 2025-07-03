extends Node2D
var que
signal bulletvelocity
signal numofbullets
signal specialattack
var enemies = 0
func _ready():
	spawn_mob()
	$enemy.player=($Player)
	$Diff.start()
	$Life.player=($Player)






func spawn_mob():
	var mob = preload("res://escenas/mob.tscn").instantiate()
	mob.player = $Player
	add_child(mob)
	
func spawn_enemy():
	var enemy = preload("res://escenas/enemy.tscn").instantiate()
	enemy.player = $Player
	add_child(enemy)


func _on_diff_timeout() -> void:


	que = randi() % 3 
	print(que)
	if(que == 0):
		emit_signal("bulletvelocity")
	elif(que == 1):
		for enemy in get_tree().get_nodes_in_group("enemigos"):
			enemy.increase_difficulty()
	elif(que == 2 ):
		emit_signal("specialattack")
		
		

func _on_enemies_timeout() -> void:
	if enemies < 5:
		spawn_enemy()
		enemies += 1


func _on_player_health_depleted() -> void:
	%Gamover.visible = true
	get_tree().paused = true


func _unhandled_input(event):
	if event.is_action_pressed("restart"):
		get_tree().paused = false
		get_tree().reload_current_scene()

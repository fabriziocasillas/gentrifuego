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
	if(que == 4):
		emit_signal("bulletvelocity")
	elif(que < 3):
		for enemy in get_tree().get_nodes_in_group("enemigos"):
			enemy.increase_difficulty()
	elif(que == 5 ):
		emit_signal("specialattack")
		
		

func _on_enemies_timeout() -> void:
	print("viene nuevo enemgo")
	if(enemies<5):
		spawn_enemy()
		enemies = enemies +1

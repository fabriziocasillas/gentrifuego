extends Node2D
var que
signal bulletvelocity
signal numofbullets
var enemies = 0
func _ready():
	spawn_mob()
	$enemy.player=($Player)
	$Diff.start()

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
	if(que == 1):
		emit_signal("bulletvelocity")
	elif(que == 2):
		emit_signal("numofbullets")
	elif(que == 0 && enemies<5):
		spawn_enemy()
		enemies += enemies
		
		
		
		
	
	

extends Node2D

func _ready():
	spawn_mob()
	$enemy.player=($Player)

func spawn_mob():
	var mob = preload("res://escenas/mob.tscn").instantiate()
	mob.player = $Player
	add_child(mob)

extends Node2D

func _ready():
	spawn_mob()

func spawn_mob():
	var mob = preload("res://escenas/mob.tscn").instantiate()
	mob.player = $Player
	add_child(mob)

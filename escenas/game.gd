extends Node2D
func _spawn_mob():
	var mob_scene = preload("res://escenas/mob.tscn")
	var mob = mob_scene.instantiate()
	mob.player = $Player  
	add_child(mob)

extends Node2D

export (float) var INTERVAL = 1.5

var Obstacle = preload("res://World/Obstacle.tscn")

func _ready():
	$Timer.wait_time = INTERVAL

func start():
	$Timer.start()

func stop():
	$Timer.stop()

func _on_Timer_timeout():
	var obstacle = Obstacle.instance()
	get_tree().current_scene.add_child(obstacle)
	obstacle.global_position = global_position
	obstacle.connect("score", get_tree().current_scene, "player_scored")


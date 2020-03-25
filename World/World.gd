extends Node2D

var score = 0 setget set_score

func _ready():
	randomize()

func new_game():
	set_score(0)
	$ObstacleSpawner.start()

func game_over():
	get_tree().call_group("obstacles", "set_physics_process", false)
	$Ground.get_node("AnimationPlayer").stop()
	$ObstacleSpawner.stop()
	$Screens.game_over(score, score)

func player_scored():
	set_score(score + 1)

func set_score(new_score):
	score = new_score
	$HUD.update_score(score)

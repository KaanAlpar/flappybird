extends Node

signal start_game

var current_screen = null

func _ready():
	register_buttons()
	change_screen($TitleScreen)

func register_buttons():
	var buttons = get_tree().get_nodes_in_group("buttons")
	for button in buttons:
		button.connect("pressed", self, "_on_Button_pressed", [button])

func _on_Button_pressed(button):
	match button.name:
		"Play":
			change_screen(null)
			emit_signal("start_game")
		"Restart":
			get_tree().reload_current_scene()

func change_screen(new_screen):
	if current_screen:
		current_screen.disappear()
		yield(current_screen.get_node("Tween"), "tween_completed")
	current_screen = new_screen
	if new_screen:
		current_screen.appear()
		yield(current_screen.get_node("Tween"), "tween_completed")

func game_over(score, highscore):
	var score_box = $GameOverScreen/MarginContainer/VBoxContainer/ScoreBox
	score_box.get_node("Score").text = "SCORE: " + str(score)
	score_box.get_node("Best").text = "BEST: " + str(highscore)
	change_screen($GameOverScreen)

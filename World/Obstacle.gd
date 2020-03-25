extends Node2D

signal score

export (int) var SPEED = 200

func _ready():
	var i = randi() % 175
	i = i * pow(-1, randi() % 2)
	$Wall_1.position.y += i
	$Wall_2.position.y += i

func _physics_process(delta):
	position.x -= SPEED * delta
	if position.x <= - 200:
		queue_free()

func _on_Wall_body_entered(body):
	if body.name == "Player":
		body.die()

func _on_ScoreArea_body_exited(_body):
	$ScoreSound.play()
	emit_signal("score")

extends StaticBody2D

func _on_DeathZone_body_entered(body):
	if body.name == "Player":
		body.die()

extends KinematicBody2D

signal died

export (int) var JUMP_FORCE = 400
export (int) var GRAVITY = 1024

var motion = Vector2()
var running = false
var dead = false

func _ready():
	$AnimationPlayer.play("Idle")

func _physics_process(delta):
	if Input.is_action_just_pressed("jump") and not dead:
		jump(JUMP_FORCE)
		$Wing.play()
		if not running:
			running = true
			$AnimationPlayer.play("Flap")
	
	if running:
		apply_gravity(delta)
	
# warning-ignore:return_value_discarded
	move_and_slide(motion)

func jump(force):
	motion.y = -force

func apply_gravity(delta):
	if not is_on_floor():
		motion.y += GRAVITY * delta

func start():
	motion = Vector2()
	position = Vector2(150,427)
	$AnimationPlayer.play("Idle")

func die():
	if not dead:
		dead = true
		$AnimationPlayer.stop()
		$Hit.play()
		emit_signal("died")

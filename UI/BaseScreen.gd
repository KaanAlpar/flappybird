extends CanvasLayer

onready var mc = $MarginContainer

func _ready():
	mc.modulate = Color(1,1,1,0)

func appear():
	get_tree().call_group("buttons", "set_disabled", false)
	$Tween.interpolate_property(self, "offset:x", 500, 0, 0.1, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	$Tween.interpolate_property(mc, "modulate", mc.modulate, Color(1,1,1,1), 1, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	$Tween.start()

func disappear():
	get_tree().call_group("buttons", "set_disabled", true)
	mc.visible = false
#	$Tween.interpolate_property(mc, "modulate", mc.modulate, Color(1,1,1,0), 0.01, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	$Tween.interpolate_property(self, "offset:x", 0, 500, 0.1, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	$Tween.start()

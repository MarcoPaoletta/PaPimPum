extends Label

func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()

func _ready():
	if g.object == "coin":
		text = "+1"
	if g.object == "bonus":
		text = "+3"
	if g.object == "gem":
		text = "+5"

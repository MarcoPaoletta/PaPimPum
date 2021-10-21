extends HBoxContainer

func _process(_delta):
	lifes(2, "H3")
	lifes(1, "H2")
	lifes(0, "H1")

func lifes(value, anim):
	if g.lifes == value:
		$Animation.play(anim)

func _on_Animation_animation_finished(anim_name):
	if anim_name == "H1":
		$H1.hide()
	if anim_name == "H2":
		$H2.hide()
	if anim_name == "H3":
		$H3.hide()

extends Area2D

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _process(delta):
	position.y += g.gravity * delta
	buttons(0)
	buttons(1)
	buttons(2)	

func buttons(n):
	if g.b[n] == true:
		if g.inside[n] == true:
			if g.delete_bonus == true:
				if g.object == "bonus":
					queue_free()
					g.delete_bonus = false
					g.object = "Null"
				
func _ready():
	rotation_degrees = rand_range(-90, 90)

func _on_Bonus_area_entered(area):
	if area.is_in_group("button1"):
		g.inside[0] = true
	if area.is_in_group("button2"):
		g.inside[1] = true
	if area.is_in_group("button3"):
		g.inside[2] = true
	g.object = "bonus"

func _on_Bonus_area_exited(area):
	if area.is_in_group("button1"):
		g.inside[0] = false
	if area.is_in_group("button2"):
		g.inside[1] = false
	if area.is_in_group("button3"):
		g.inside[2] = false
	g.object = "Null"

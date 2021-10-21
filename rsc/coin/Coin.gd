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
			if g.delete == true:
				if g.object == "coin":
					queue_free()
					g.delete = false
					g.object = "Null"

func _ready():
	if g["save_dict"]["game"]["save_resources"]:
		$Animation.animation = "save"
	if !g["save_dict"]["game"]["save_resources"]:
		var r = randi() % 3
		if r == 0:
			$Animation.animation = "silver"
		if r == 1:
			$Animation.animation = "gold"
		if r == 2:
			$Animation.animation = "blue"
	rotation_degrees = rand_range(-55, 55)
	$Animation.speed_scale = randi() % 5 + 5


func _on_Coin_area_entered(area):
	if area.is_in_group("button1"):
		g.inside[0] = true
	if area.is_in_group("button2"):
		g.inside[1] = true
	if area.is_in_group("button3"):
		g.inside[2] = true
	g.object = "coin"

func _on_Coin_area_exited(area):
	if area.is_in_group("button1"):
		g.inside[0] = false
	if area.is_in_group("button2"):
		g.inside[1] = false
	if area.is_in_group("button3"):
		g.inside[2] = false
	g.object = "Null"

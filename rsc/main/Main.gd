extends Node

var c = preload("res://rsc/coin/Coin.tscn")
var b = preload("res://rsc/bonus/Bonus.tscn")
var coin_effect = preload("res://rsc/score_effect/ScoreEffect.tscn")
var wrong = preload("res://rsc/wrong_pressed/WrongPressed.tscn")
var gem = preload("res://rsc/gem/Gem.tscn")

var alive = true
var sum_time = true

var node 

func _ready():
	$Musics/Playing.stream_paused = false
	g.load_data()
	g["save_dict"]["stats"]["matches_played"] += 1
	g.lifes = 3
	g.score = 0
	$GameOver.hide()
	randomize()
	
func _on_SpawnTimer_timeout():
	var increase_time = rand_range(0.001, 0.01)	
	if $SpawnTimer.wait_time < 0.5:
		sum_time = false
	else:
		sum_time = true
	if sum_time: 
		$SpawnTimer.wait_time -= increase_time
	var r = randi() % 3
	if r == 0:
		spawn_prop(18, "red")
	if r == 1:
		spawn_prop(186, "blue")
	if r == 2:
		spawn_prop(354, "yellow")
		
func spawn_prop(x, m):
	var random_object = randi() % 6
	if alive: 
		
		if random_object <= 3:
			instance_object(c.instance())
			if g["save_dict"]["game"]["save_resources"]: 
				var coin_modulate = m
				if m == "red":
					coin_modulate = Color(0.839216, 0.109804, 0.109804)
				if m == "blue":
					coin_modulate = Color(0.12549, 0.568627, 0.890196)
				if m == "yellow":
					coin_modulate = Color(1, 0.984314, 0)
				node.modulate = coin_modulate

		if random_object == 4:
			instance_object(b.instance())

		if random_object == 5:
			instance_object(gem.instance())
			
		$CoinContainer.add_child(node)
		node.global_position.x = x + 64
		node.global_position.y = -20
	g.save_data()

func instance_object(instance):
	node = instance

func score(increase):
	g.score += increase
	$Score.text = str(g.score)
	g.save_dict["stats"]["total_points"] += increase
	g.save_data()
	var coin_effect_ins = coin_effect.instance()
	add_child(coin_effect_ins)

func element(who):
	if who.is_in_group("c"):
		g.object = "coin"
	if who.is_in_group("b"):
		g.object = "bonus"
	if who.is_in_group("g"):
		g.object = "gem"

func _on_b1_button_up():
	g.b[0] = false

func _on_b2_button_up():
	g.b[1] = false

func _on_b3_button_up():
	g.b[2] = false

func inside(n, button):
	button.modulate = "8f27f7"

func outside(n, button):
	if button == "red":
		$Buttons/b1.modulate = "d61c1c"
	if button == "blue":
		$Buttons/b2.modulate = "2091e3"
	if button == "yellow":
		$Buttons/b3.modulate = "fffb00"

func lack_time(button):
	if !g.inside[button]:
		var wrong_pressed_ins = wrong.instance()
		add_child(wrong_pressed_ins)
		g.score -= 1
		$Score.text = str(g.score)

func delete_coin(n):
	if g.inside[n] == true and g.b[n] == true:
		if g.object == "coin":
			score(1)
			g.delete = true
			$Audios/Scored.play()
		if g.object == "bonus":
			score(3)
			g.delete_bonus = true
			$Audios/Bonus.play()
		if g.object == "gem":
			score(5)
			g.delete_gem = true
			$Audios/Gem.play()

func _on_b1_hitbox_area_entered(area):
	element(area)
	inside(0, $Buttons/b1)

func _on_b1_hitbox_area_exited(area):
	element(area)
	outside(0, "red")
	
func _on_b2_hitbox_area_entered(area):
	element(area)
	inside(1, $Buttons/b2)

func _on_b2_hitbox_area_exited(area):
	element(area)
	outside(1, "blue")

func _on_b3_hitbox_area_entered(area):
	element(area)
	inside(2, $Buttons/b3)

func _on_b3_hitbox_area_exited(area):
	element(area)
	outside(2, "yellow")

func _on_b1_pressed():
	lack_time(0)
	g.b[0] = true
	delete_coin(0)
	$Audios/Button1.play()

func _on_b2_pressed():
	lack_time(1)
	g.b[1] = true
	delete_coin(1)
	$Audios/Button2.play()

func _on_b3_pressed():
	lack_time(2)
	g.b[2] = true
	delete_coin(2)
	$Audios/Button3.play()

func _on_Limit_area_exited(area):
	g.load_data()
	if area.is_in_group("c") or area.is_in_group("g"):
		$Audios/Hit.play()
		g.lifes -= 1
		if g.lifes <= 0:
			$Musics/Playing.stream_paused = true
			alive = false
			$CoinContainer.queue_free()
			$GameOver/P/CenterContainer/VBoxContainer/Score.text = "SCORE = " + str(g.score)
			if g.score > g.save_dict["game"]["highscore"]:
				g.save_dict["game"]["highscore"] = g.score
				$GameOver/P/CenterContainer/VBoxContainer/HighScore.text = "HIGHSCORE = " + str(g.save_dict["game"]["highscore"])
			else:
				$GameOver/P/CenterContainer/VBoxContainer/HighScore.text = "HIGHSCORE = " + str(g.save_dict["game"]["highscore"])
			$GameOver.show()
			$GameOver/Animation.play("entered")

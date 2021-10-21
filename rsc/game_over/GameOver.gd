extends Node

func _on_Lobby_pressed():
	$Lobby.play()
	$P/CenterContainer/VBoxContainer/Lobby.disabled = true
	yield($Lobby, "finished")
	get_tree().change_scene("res://rsc/lobby/Lobby.tscn")

func _on_Again_pressed():
	$Again.play()
	$P/CenterContainer/VBoxContainer/Again.disabled = true
	yield($Again, "finished")
	get_tree().reload_current_scene()

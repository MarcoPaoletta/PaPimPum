extends Control

func _on_Play_pressed():
	$Play.play()
	$VBoxContainer/Buttons/VBoxContainer/Play.disabled = true
	$VBoxContainer/Buttons/VBoxContainer/Settings.disabled = true
	yield($Play, "finished")
	get_tree().change_scene("res://rsc/main/Main.tscn")

func _on_Settings_pressed():
	$Settings.play()
	$VBoxContainer/Buttons/VBoxContainer/Settings.disabled = true
	$VBoxContainer/Buttons/VBoxContainer/Play.disabled = true
	yield($Settings, "finished")
	get_tree().change_scene("res://rsc/settings/Settings.tscn")

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		g.save_data() 
		
func _ready():
	g.load_data()
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound"), g["save_dict"]["audio"]["sound"])
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), g["save_dict"]["audio"]["music"])
	g.save_data()

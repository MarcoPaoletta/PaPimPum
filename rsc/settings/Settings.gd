extends Control

func _ready():
	g.load_data()
	if g["save_dict"]["game"]["save_resources"]:
		$LowCheckBox.pressed = true
	if !g["save_dict"]["game"]["save_resources"]:
		$LowCheckBox.pressed = false

func _on_button_pressed():
	$Sound.play()
	$SoundContainer/Sound.disabled = true
	$HBoxContainer/Reset.disabled = true
	yield($Sound, "finished")
	get_tree().change_scene("res://rsc/audio_settings/AudioSettings.tscn")

func _on_Reset_pressed():
	$ResetDialog.popup()
	$HBoxContainer/Reset.disabled = true
	
func _on_CheckBox_pressed():
	g["save_dict"]["game"]["save_resources"] = !g["save_dict"]["game"]["save_resources"]
	g.save_data()


func _on_ResetDialog_confirmed():
	var file = File.new()
	if file.file_exists(g.path):
		Directory.new().remove(g.path)
		$Deleted.play()
		yield($Deleted, "finished")
		get_tree().quit()
		
func _on_ResetDialog_popup_hide():
	$HBoxContainer/Reset.disabled = false

extends Node

var sound_finished = false
var music_finished = false


func _ready():
	g.load_data()
	$Music/MusicSlider.value = g["save_dict"]["audio"]["music"]
	$Music/SoundSlider.value = g["save_dict"]["audio"]["sound"]

func change_volume(bus, n):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(bus), n)
	g.save_data()
	
func _on_MusicSlider_value_changed(value):
	change_volume("Music", value)
	g["save_dict"]["audio"]["music"] = value
	g.save_data()
	if music_finished:
		$Musics/Playing.play()
		music_finished = false
		$MusicFinished.start()

func _on_SoundSlider_value_changed(value):
	change_volume("Sound", value)
	g["save_dict"]["audio"]["sound"] = value
	g.save_data()
	if sound_finished:
		$Audios/Button1.play()
		sound_finished = false
		$SoundFinished.start()
		
func reset_volume(bus):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(bus), 0)
	g.save_data()
	
func _on_Music_pressed():
	reset_volume("Music")
	$Music/MusicSlider.value = 0
	g["save_dict"]["audio"]["music"] = 0
	if music_finished:
		$Musics/Playing.play()
		music_finished = false
		$MusicFinished.start()
	
func _on_Sound_pressed():
	reset_volume("Sound")
	$Music/SoundSlider.value = 0
	g["save_dict"]["audio"]["sound"] = 0

func _on_SoundFinished_timeout():
	sound_finished = true

func _on_MusicFinished_timeout():
	music_finished = true
	$Musics/Playing.playing = false

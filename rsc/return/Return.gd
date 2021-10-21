extends Node

var can_press = true

export (String) var scene_path

func _on_Return_pressed():
	can_press = false
	$Sound.play()
	yield($Sound, "finished")
	get_tree().change_scene(scene_path)
	can_press = true

func _process(_delta):
	if can_press:
		$Return.disabled = false
	if !can_press:
		$Return.disabled = true

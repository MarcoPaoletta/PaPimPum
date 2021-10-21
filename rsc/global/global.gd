extends Node

var path = "user://save.txt" 
func save_data():
	var save_file = File.new() # CREATE FILE
	save_file.open(path, File.WRITE) # OPEN IT IN THE PATH AND WRITE IN IT
	var data = {
		"save_dict" : save_dict # TO STORE VAR
	}
	save_file.store_var(data) # STORE
	save_file.close() # CLOSE

func load_data():
	var save_file = File.new() # GO TO THE FILE AGAIN
	if !save_file.file_exists(path): # IF IT DOES NOT EXIST
		return # WE RETURN SO THAT IT WILL BE CREATED
	save_file.open(path, File.READ) # OEN IT IN THE PATH AND READ IT
	var data = save_file.get_var() # CREATE A VAR TO GET THE VAR STORED IN THE FILE
	save_dict = data["save_dict"] # MODIFY THE DATA IN THE DICT
	save_file.close() # CLOSE



var inside = [false, false, false]
var b = [false, false, false]

var delete = false
var delete_bonus = false
var delete_gem = false

var object

var gravity = 200
var lifes = 3
var score = 0

func _ready():
	OS.center_window()

func _process(delta):
	if Input.is_key_pressed(KEY_F11):
		OS.window_maximized = OS.window_maximized

var save_dict = {
	"game" : {
		"highscore" : 0,
		"save_resources" : false,
	},
	"audio": {
		"sound" : 0,
		"music" : 0,
	},
	"stats": {
		"matches_played" : 0,
		"total_points" : 0,
	}

}

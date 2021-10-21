extends ColorRect
export (String) var COLOR

func _ready():
	if COLOR == "blue":
		$Animation.play("fade_blue")
	if COLOR == "black":
		$Animation.play("fade_black")
	

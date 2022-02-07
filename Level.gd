extends Node2D


var timer
var counter

func _ready():
	timer = $Node/Timer
	counter = $Node/Timer/RichTextLabel
	timer.start(91)

func _process(delta):
	counter.text = str(int(timer.get_time_left()))
	if timer.get_time_left() < 1:
		var main = self.get_parent()
		main.game_over()



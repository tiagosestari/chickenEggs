extends Node2D


var timer
var counter
var eggs = 0
var egg1 = false
var egg2 = false
var egg3 = false
var egg4 = false
var egg5 = false
var egg6 = false
var egg7 = false
var egg8 = false
var egg9 = false
var egg10 = false

func _ready():
	timer = $Node/Timer
	counter = $Node/Timer/RichTextLabel
	timer.start(91)

func _process(delta):
	counter.text = "Time to egg boil: " + str(int(timer.get_time_left()))
	if timer.get_time_left() < 1:
		var main = self.get_parent()
		main.game_over()



extends Node2D

var initialDifficulty

func _ready():
	var start_resource = load("res://Start.tscn")
	var 	start = start_resource.instance()
	self.add_child(start)

func start_Game(difficulty):
	var level_resource = load("res://Level.tscn")
	var 	level = level_resource.instance()
	self.add_child(level)
	initialDifficulty = difficulty
	
	if difficulty == "easy":
		removeTimer()
	
	var gs = self.get_node("Start")
	print(gs)
	self.remove_child(gs)
	
func removeTimer():
	var t = self.get_node("Level/Node/Timer")
	t.set_paused(true)
	

func game_over():
	var level = self.get_node("Level")
	self.remove_child(level)
	
	var go_resource = load("res://game_over.tscn")
	var go = go_resource.instance()
	self.add_child(go)
	

func try_again():
	var level_resource = load("res://Level.tscn")
	var 	level = level_resource.instance()
	self.add_child(level)
	
	if initialDifficulty == "easy":
		removeTimer()
	
	var go = self.get_node("game_over")
	self.remove_child(go)

func winGame():
	var winScreen_r = load("res://WinScreen.tscn")
	var winScreen = winScreen_r.instance()
	self.add_child(winScreen)
	var level = $Level
	remove_child(level)
	
func how_to_play():
	var htp_r = load("res://Howtoplay.tscn")
	var htp = htp_r.instance()
	self.add_child(htp)
	
	var gs = self.get_node("Start")
	print(gs)
	self.remove_child(gs)
	
func close_how_to_play():
	var start_resource = load("res://Start.tscn")
	var 	start = start_resource.instance()
	self.add_child(start)
	var htp = $Howtoplay 
	self.remove_child(htp)
	

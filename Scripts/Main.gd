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

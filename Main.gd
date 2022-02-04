extends Node2D

func _ready():
	var level_resource = load("res://Level.tscn")
	var 	level = level_resource.instance()
	self.add_child(level)

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
	
	var go = self.get_node("game_over")
	self.remove_child(go)

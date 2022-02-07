extends Area2D


#var eggs = 0
#var egg1 = false
#var egg2 = false
#var egg3 = false
#var egg4 = false

func _process(delta):
	var level = self.get_parent()
	print(level.eggs)
	if level.eggs == 10:
		level.eggs += 1
		level = self.get_parent()
		var main = level.get_parent()
		main.winGame()


func _on_Nest_body_entered(body):
	var level = self.get_parent()
	if body.name == "Player" and get_node("../Egg").picked == true:
		if !level.egg1: 
			level.eggs += 1
			level.egg1 = true
		#print("Win")
	if body.name == "Player" and get_node("../Egg2").picked == true:
		if !level.egg2: 
			level.eggs += 1
			level.egg2 = true
		#print("Win")
	if body.name == "Player" and get_node("../Egg3").picked == true:
		if !level.egg3: 
			level.eggs += 1
			level.egg3 = true
		#print("Win")
	if body.name == "Player" and get_node("../Egg4").picked == true:
		if !level.egg4: 
			level.eggs += 1
			level.egg4 = true
	if body.name == "Player" and get_node("../Egg5").picked == true:
		if !level.egg5: 
			level.eggs += 1
			level.egg5 = true
	if body.name == "Player" and get_node("../Egg6").picked == true:
		if !level.egg6: 
			level.eggs += 1
			level.egg6 = true
	if body.name == "Player" and get_node("../Egg7").picked == true:
		if !level.egg7: 
			level.eggs += 1
			level.egg7 = true
	if body.name == "Player" and get_node("../Egg8").picked == true:
		if !level.egg8: 
			level.eggs += 1
			level.egg8 = true
	if body.name == "Player" and get_node("../Egg9").picked == true:
		if !level.egg9: 
			level.eggs += 1
			level.egg9 = true
	if body.name == "Player" and get_node("../Egg10").picked == true:
		if !level.egg10: 
			level.eggs += 1
			level.egg10 = true
		#print("Win")

extends Area2D


func _on_Button_pressed():
	var main = get_parent()
	main.start_Game("easy")


func _on_Button3_pressed():
	var main = get_parent()
	main.start_Game("hard")


func _on_Button2_pressed():
	var main = get_parent()
	main.how_to_play()

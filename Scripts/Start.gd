extends Area2D


func _on_Button_pressed():
	var main = get_parent()
	main.start_Game("easy")


func _on_Button3_pressed():
	var main = get_parent()
	main.start_Game("hard")

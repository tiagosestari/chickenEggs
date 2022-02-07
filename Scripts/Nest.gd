extends Area2D





func _on_Nest_body_entered(body):
	if body.name == "Player" and get_node("../Egg").picked == true:
		print("Win")

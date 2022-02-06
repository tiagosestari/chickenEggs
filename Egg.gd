extends RigidBody2D


var picked

func _ready():
	picked = false
	
func _process(delta):
	#print(get_node("../Player").canPick)
	if picked == true:
		self.position = get_node("../Player/Position2D").global_position
		
func _input(event):
	if Input.is_action_just_released("ui_pick"):
		var bodies = $pick.get_overlapping_bodies()
		#print(bodies)
		for body in bodies:
			if body.is_in_group("Player") and get_node("../Player").canPick == true:
				#print(body.name, body.is_in_group("Player"), get_node("../Player").canPick == true)
				if picked == false:
					pickUp()
	if Input.is_action_just_released("ui_drop"):
		var bodies = $pick.get_overlapping_bodies()
		#print(bodies)
		for body in bodies:
			if body.is_in_group("Player") and get_node("../Player").canPick == false:
				if picked == true:
					drop()
					
func pickUp():
	#print("I GOT CALLED")
	self.picked = true
	get_node("../Player").canPick = false

func drop():
	#print("I GOT CALLED TOO")
	picked = false
	get_node("../Player").canPick = true
	if get_node("../Player/sprite").flip_h == true:
		self.position.x = get_node("../Player/Position2D").global_position.x + 10
		self.position.y = get_node("../Player/Position2D").global_position.y + 5
	else:
		self.position.x = get_node("../Player/Position2D").global_position.x - 10
		self.position.y = get_node("../Player/Position2D").global_position.y + 5
	
	

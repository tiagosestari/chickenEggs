extends RigidBody2D


var picked
export var timeHolding = 30

func _ready():
	picked = false
	
func _process(delta):
	#print(get_node("../Player").canPick)	
	if picked == true:
		self.position = get_node("../Player/Position2D").global_position
		#$Timer/TimerLabel.clear()
		#$Timer/TimerLabel.add_text(str(int($Timer.get_time_left())))
		$Label.text = str(int($Timer.get_time_left())+1)
		if $Timer.get_time_left() < 1:
			var level = get_parent()
			var main = level.get_parent()
			main.game_over()
	else:
		$Label.text = ""
		
func _input(event):
	if Input.is_action_just_released("ui_pick"):
		var bodies = $pick.get_overlapping_bodies()
		#print(bodies)
		for body in bodies:
			if body.is_in_group("Player") and get_node("../Player").canPick == true:
				#print(body.name, body.is_in_group("Player"), get_node("../Player").canPick == true)
				if picked == false:
					if($Timer.is_paused()):
						$Timer.set_paused(false)
					$Timer.start(timeHolding)
					pickUp()
	
	if Input.is_action_just_released("ui_drop"):
		var bodies = $pick.get_overlapping_bodies()
		#print(bodies)
		for body in bodies:
			if body.is_in_group("Player") and get_node("../Player").canPick == false:
				if picked == true:
					$Timer.set_paused(true)
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
		self.apply_impulse(Vector2(), Vector2(90, -10))
		#self.position.x = get_node("../Player/Position2D").global_position.x + 10
		#self.position.y = get_node("../Player/Position2D").global_position.y + 5
	else:
		self.apply_impulse(Vector2(), Vector2(-90, -10))
		#self.position.x = get_node("../Player/Position2D").global_position.x - 10
		#self.position.y = get_node("../Player/Position2D").global_position.y + 5
	
	

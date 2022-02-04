extends Area2D


export var speed = 400
export var pan_shot: PackedScene

var screen_size 
var mr = true
var found = false
var pointer
var ray
var ray2
var ray3
var ray4
var ray5
var sprite



# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.get_position())
	screen_size = get_viewport_rect().size
	pointer = $pointer
	ray = $pointer/RayCast2D
	ray2 = $pointer/RayCast2D2
	ray3 = $pointer/RayCast2D3
	ray4 = $pointer/RayCast2D4
	ray5 = $pointer/RayCast2D5
	sprite = $pointer/Sprite
	
func _process(delta):
	var p = self.get_position()
	#var r = self.get_rotation()
	
	var velocity = Vector2.ZERO
	
	if (p.x == screen_size.x):
		#rotation_dir += -180
		pointer.rotation_degrees += 180
		mr = false
	if (p.x == 0):
		#rotation_dir += 180
		pointer.rotation_degrees -= 180
		mr = true
	
	if (mr == true):
		velocity = Vector2(1,0)
	else:
		velocity = Vector2(-1,0)
	
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	if (!found):
		position += velocity * delta
	else:
		position = position

	#restrains player inside screen
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	#shoot(ray)
	#shoot(ray2)
	#shoot(ray3)
	#shoot(ray4)
	#shoot(ray5)
	lookfor(ray)
	lookfor(ray2)
	lookfor(ray3)
	lookfor(ray4)
	lookfor(ray5)


func lookfor(a):
	if a.is_colliding():
		if a.get_collider().is_in_group("Player"):
			#print(a, ray.get_collider())
			found = true
			sprite.modulate = Color(0,1,0)
			var level = get_parent()
			var main = level.get_parent()
			main.game_over()
		else:
			sprite.modulate = Color(1,0,0)
	else:
		sprite.modulate = Color(1,0,0)

# Testing if the enemy should shoot, but  probably will just work on a stealth mechanics.
#func shoot(a)->void:
#	if a.is_colliding():
#		if a.get_collider().is_in_group("Player"):
#			var temp = pan_shot.instance()
#			add_child(temp)
#			temp.global_position = global_position
#			temp.rotation_degrees = pointer.rotation_degrees
#			temp.setup(a.get_collision_point())

#func shoot(a, b):
#	if a.is_colliding():
#		if a.get_collider().is_in_group("Player"):
#				var velocity = a.get_collision_point()
#				position -= velocity * b

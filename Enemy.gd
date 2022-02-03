 extends Area2D




export var speed = 400

var screen_size 
var mr = true

var pointer
var ray
var sprite



# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.get_position())
	screen_size = get_viewport_rect().size
	pointer = $pointer
	ray = $pointer/RayCast2D
	sprite = $pointer/Sprite
	
func _process(delta):
	var p = self.get_position()
	var r = self.get_rotation()
	
	var velocity = Vector2.ZERO
	
	if (p.x == screen_size.x):
		#rotation_dir += -180
		self.rotation_degrees += 180
		mr = false
	if (p.x == 0):
		#rotation_dir += 180
		self.rotation_degrees -= 180
		mr = true
	
	if (mr == true):
		velocity = Vector2(1,0)
	else:
		velocity = Vector2(-1,0)
	
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	
	position += velocity * delta

	#restrains player inside screen
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
		
	shoot()


func shoot():
	if ray.is_colliding():
		print(ray.get_collider())
		if ray.get_collider().is_in_group("Player"):
			sprite.modulate = Color(0,1,0)
		else:
			sprite.modulate = Color(1,0,0)
	else:
		sprite.modulate = Color(1,0,0)


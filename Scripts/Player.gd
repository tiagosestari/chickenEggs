extends KinematicBody2D


export var speed = 400
var velocity = Vector2()
var screen_size 
var canPick = true


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('move_right'):
		velocity.x += 1
		get_node('sprite').flip_h = true
	if Input.is_action_pressed('move_left'):
		velocity.x -= 1
		get_node('sprite').flip_h = false
	if Input.is_action_pressed('move_down'):
		velocity.y += 1
	if Input.is_action_pressed('move_up'):
		velocity.y -= 1
	
	if velocity.length() > 0:
		$sprite.play()
		velocity = velocity.normalized() * speed
	else:
		$sprite.stop()

func _physics_process(delta):
	get_input()
	#print(velocity)
	velocity = move_and_slide(velocity)
	#for index in get_slide_count():
	#	var collision := get_slide_collision(index)
	#	var body := collision.collider
	#	print("Collided with: ", body.name)
	#position += velocity * delta
		
	#restrains player inside screen
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)


func _on_Player_body_entered(body):
	print(body.name)
	

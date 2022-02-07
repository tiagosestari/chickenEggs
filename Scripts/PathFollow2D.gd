extends PathFollow2D
export var speed = 200

func _process(delta):
	set_offset(get_offset() + speed * delta)
	$Enemy/AnimatedSprite.play()
	
	if get_offset() > 1070:
		$Enemy/AnimatedSprite.flip_v = true
	else:
		$Enemy/AnimatedSprite.flip_v = false
	

extends KinematicBody2D

signal hit

export var speed = 40
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
#	hide()

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	#position += velocity * delta
	move_and_slide(velocity)
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "Walk"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
#	elif velocity.y != 0:
#		$AnimatedSprite.animation = "up"
#		AnimatedSprite.flip_v = velocity.y > 0



extends KinematicBody2D

const GRAVITY = 20
var flap_force = -400
onready var screen_size = get_viewport().size

var elapsed = 0.0
var motion = Vector2.ZERO
var angular_motion = 0
var collision_data
var is_dead = false

func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("flap"):
		jump()
	
func _physics_process(delta):
	if is_dead: return
	else:
		position.y = clamp(position.y, 20, screen_size.y)
		motion.y += GRAVITY
		collision_data = move_and_collide(motion * delta)
		
		if motion.y < 300:
			angular_motion = -15
			rotation_degrees = angular_motion
		else:
			angular_motion += 5
			angular_motion = clamp(angular_motion, -15, 90)
			rotation_degrees = angular_motion

func jump():
	motion = Vector2(0, 0)
	motion.y += flap_force
	$FlyAudio.play()

func dead():
	motion = Vector2(0, 0)
	$Sprite.stop()
	$HitAudio.play()
	is_dead = true
	get_parent().end_game()
	
func start():
	$Sprite.play()
	is_dead = false

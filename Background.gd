extends Node

onready var parallax = get_node("ParallaxBackground")

var is_game_over = false
var parallax_offset = 0
var speed = 100

func _ready():
	pass # Replace with function body.

func _process(delta):
	if is_game_over: return
	else:
		parallax_offset -= speed * delta
		parallax.set_scroll_offset(Vector2(parallax_offset, 0))

func start_game():
	is_game_over = false

func game_over():
	is_game_over = true

func _on_Area2D_body_entered(body):
	if body.has_method("dead"):
		body.dead()

extends Position2D

signal scored

export var speed = 100
var is_game_over = false

func _ready():
	pass # Replace with function body.

func _process(delta):
	if is_game_over: return
	else:
		position.x -= speed * delta

func game_over():
	is_game_over = true

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Pipe_body_entered(body):
	if body.has_method("dead"):
		body.dead()

func _on_ScoreCollider_body_entered(_body):
	$ScoreAudio.play()
	emit_signal("scored")

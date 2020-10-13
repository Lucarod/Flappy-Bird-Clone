extends Node

onready var pipes = preload("res://scenes/Pipes.tscn")
onready var player = get_node("Player")
onready var hud = get_node("CanvasLayer/HUD")
onready var game_over_screen = get_node("CanvasLayer/GameOverScreen")

var is_game_over = false
var score = 0

func _ready():
	new_game()

func _input(event):
	if event.is_action_pressed("flap") and is_game_over:
		new_game()

func new_game():
	if get_tree().get_nodes_in_group("Pipe").size() > 0:
		delete_entities_of_group("Pipe")
	player.position = Vector2(50, 200)
	score = 0
	hud.clear_numbers()
	hud.set_score(score)
	$Timer.start()
	$Background.start_game()
	game_over_screen.visible = false
	is_game_over = false
	$Player.start()

func end_game():
	$Timer.stop()
	$Background.game_over()
	stop_entities_of_group("Pipe")
	game_over_screen.visible = true
	is_game_over = true
	
func stop_entities_of_group(group):
	var entities = get_tree().get_nodes_in_group(group)
	for entity in entities:
		entity.game_over()
		
func delete_entities_of_group(group):
	var entities = get_tree().get_nodes_in_group(group)
	for entity in entities:
		entity.queue_free()

func _on_Pipes_scored():
	score += 1
	hud.set_score(score)

func _on_Timer_timeout():
	randomize()
	var random = randi() % 225 + 75
	var pipe = pipes.instance()
	pipe.connect("scored", self, "_on_Pipes_scored")
	add_child(pipe)
	pipe.position.y = random

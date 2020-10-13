extends Control

onready var numbers_array = [preload("res://flappy-bird-assets-master/sprites/0.png"),
							 preload("res://flappy-bird-assets-master/sprites/1.png"),
							 preload("res://flappy-bird-assets-master/sprites/2.png"),
							 preload("res://flappy-bird-assets-master/sprites/3.png"),
							 preload("res://flappy-bird-assets-master/sprites/4.png"),
							 preload("res://flappy-bird-assets-master/sprites/5.png"),
							 preload("res://flappy-bird-assets-master/sprites/6.png"),
							 preload("res://flappy-bird-assets-master/sprites/7.png"),
							 preload("res://flappy-bird-assets-master/sprites/8.png"),
							 preload("res://flappy-bird-assets-master/sprites/9.png"),]

onready var number_container = get_node("MarginContainer/CenterContainer/HBoxContainer")

func _ready():
	pass # Replace with function body.

func clear_numbers():
	number_container.get_node("FirstNumber").texture = null
	number_container.get_node("SecondNumber").texture = null
	number_container.get_node("ThirdNumber").texture = null

func set_score(number):
	var string_number = String(number)
	var sprite_number
	
	match string_number.length():
		1:
			sprite_number = number
			number_container.get_node("FirstNumber").texture = numbers_array[sprite_number]
		2:
			sprite_number = int(number / 10)
			number_container.get_node("SecondNumber").texture = numbers_array[sprite_number]
			sprite_number = number % 10
			number_container.get_node("FirstNumber").texture = numbers_array[sprite_number]
		3:
			sprite_number = int(number / 100)
			number_container.get_node("FirstNumber").texture = numbers_array[sprite_number]
			
			number = int(number % 100)
			
			sprite_number = int(number / 10)
			number_container.get_node("SecondNumber").texture = numbers_array[sprite_number]
			sprite_number = int(number % 10)
			number_container.get_node("ThirdNumber").texture = numbers_array[sprite_number]

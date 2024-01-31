extends Node2D

var card_scene: PackedScene = preload("res://scenes/objects/card.tscn")

var card_values: Array[String] = ["ace", "two", "three", "four", "five",
	"six", "seven", "eight", "nine", "ace", "two", "three", "four", "five",
	"six", "seven", "eight", "nine"]

func _ready():
	
	# initial fanning out
	var room_width = get_viewport_rect().size.x
	var room_height = get_viewport_rect().size.y
	
	var delta_x = int(room_width / 7)
	var delta_y = int(room_height / 4)
	
	var curr_wait_time = 0.5

	for i in range(1, 4):
		for j in range(1, 7):
			var card_instance = card_scene.instantiate() as Node2D
			card_instance.final_pos = Vector2(j * delta_x, i * delta_y)
			card_instance.position = Vector2(room_width / 2, -300)
			card_instance.time_to_wait = curr_wait_time
			card_instance.rotation_degrees = -90
			
			# assign random value
			var chosen_index = randi_range(0, card_values.size() - 1)
			card_instance.value = card_values[chosen_index]
			card_values.remove_at(chosen_index)
			
			add_child(card_instance)
			curr_wait_time += 0.04
		curr_wait_time += 0.2

extends Node2D

var card_scene: PackedScene = preload("res://scenes/objects/card.tscn")

var card_back_texture = preload("res://assets/card_back.png")
var card_front_texture = preload("res://assets/card_front.png")

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
			curr_wait_time += 0.04
			add_child(card_instance)
			card_instance.connect("card_click", on_card_click)
		curr_wait_time += 0.2

func on_card_click(event, card):
	if (event is InputEventMouseButton and event.pressed):
		
		var sprite = card.get_node("Sprite2D")
		if (sprite.texture == card_back_texture):
			sprite.texture = card_front_texture
		else:
			sprite.texture = card_back_texture

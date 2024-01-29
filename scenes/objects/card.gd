extends Node2D

var card_back_texture = preload("res://assets/card_back.png")
var card_front_texture = preload("res://assets/card_front.png")

@export var fan_speed: float = 3500

var final_pos: Vector2 = Vector2.ZERO
var is_moving: bool = false
var time_to_wait: float = 0

func _ready():
	$FanTimer.start(time_to_wait)

func _process(delta):
	
	# initial fanning out
	if (is_moving):
		var direction = (final_pos - position).normalized()
		position += direction * fan_speed * delta
		
		var curr_vector_length = (direction * fan_speed * delta).length()
		var final_vector_length = (final_pos - position).length()
		
		if (final_vector_length <= curr_vector_length):
			position = final_pos
			is_moving = false

func _on_fan_timer_timeout():
	is_moving = true

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton and event.pressed):
		var sprite = get_node("Sprite2D")
		if (sprite.texture == card_back_texture):
			sprite.texture = card_front_texture
		else:
			sprite.texture = card_back_texture

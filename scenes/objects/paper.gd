extends Node2D

signal selected()

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton and event.pressed):
		selected.emit()

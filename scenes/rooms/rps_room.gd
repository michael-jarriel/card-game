extends Node2D

var cpu_selection

func _ready():
	cpu_selection = choose_random_rps()

func choose_random_rps() -> int:
	match (randi_range(0, 2)):
		0:
			return Global.RPS.ROCK
		1:
			return Global.RPS.PAPER
		2:
			return Global.RPS.SCISSORS
		_:
			return 0

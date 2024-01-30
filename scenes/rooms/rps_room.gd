extends Node2D

enum RPS {ROCK, PAPER, SCISSORS}

var cpu_selection

func _ready():
	cpu_selection = choose_random_rps()

func choose_random_rps() -> int:
	match (randi_range(0, 2)):
		0:
			return RPS.ROCK
		1:
			return RPS.PAPER
		2:
			return RPS.SCISSORS
		_:
			return 0

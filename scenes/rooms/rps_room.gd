extends Node2D

enum RPS {ROCK, PAPER, SCISSORS}

var cpu_selection

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
			
func determine_winner(player_selection):
	cpu_selection = choose_random_rps()
	print(cpu_selection)
	if ((player_selection == RPS.ROCK and cpu_selection == RPS.SCISSORS) or
		(player_selection == RPS.PAPER and cpu_selection == RPS.ROCK) or
		(player_selection == RPS.SCISSORS and cpu_selection == RPS.PAPER)):
			print("you win!")
	elif ((player_selection == RPS.ROCK and cpu_selection == RPS.PAPER) or
		(player_selection == RPS.PAPER and cpu_selection == RPS.SCISSORS) or
		(player_selection == RPS.SCISSORS and cpu_selection == RPS.ROCK)):
			print("you lose!")
	else:
		print("you tied!")

func _on_rock_selected():
	determine_winner(RPS.ROCK)

func _on_paper_selected():
	determine_winner(RPS.PAPER)

func _on_scissors_selected():
	determine_winner(RPS.SCISSORS)

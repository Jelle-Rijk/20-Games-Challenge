extends Node

signal update_labels(score_array)

var team_1_score: int = 0
var team_2_score: int = 0
var score_label: Label
var score_label_2: Label

func reset_score():
	team_1_score = 0
	team_2_score = 0
	
func add_score(team_id):
	if team_id == 1:
		team_1_score += 1
	elif team_id == 2:
		team_2_score += 1
	update_labels.emit([str(team_1_score), str(team_2_score)])

extends Node

var high_score: int = 0
var current_score : int = 0
@onready var high_score_label: Label = get_node("/root/Main/UI/HighScore_Label")
var save_path = "user://high_score.save"

func check_score(score: int) -> void:
	current_score = score
	if score > high_score:
		high_score = score
		save_high_score()

func save_high_score():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(high_score)

func load_high_score() -> void:
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		high_score = file.get_var(high_score)

func reset_high_score() -> void:
	high_score = 0
	save_high_score()

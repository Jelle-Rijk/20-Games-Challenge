extends PanelContainer

@onready var score_label: Label = $VBoxContainer/Score_Label
@onready var high_score_label: Label = $VBoxContainer/HighScore_Label

func _on_visibility_changed() -> void:
	if visible == false:
		return
	score_label.text = str(HighScoreTracker.current_score)
	high_score_label.text = str("Your high score: ", HighScoreTracker.high_score)
	
func _on_restart_button_pressed() -> void:
	get_node("/root/Main").reset()
	
func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_delete_data_button_pressed() -> void:
	HighScoreTracker.reset_high_score()
	get_node("/root/Main").reset()

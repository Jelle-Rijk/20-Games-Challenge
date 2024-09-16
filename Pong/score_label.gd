extends Label

@export var team_id: int

func _ready():
	if team_id == null:
		printerr("Did not set the label's team_id.")
	ScoreKeeper.connect("update_labels", update_score)

func update_score(score):
	self.text = score[team_id - 1]

extends Node2D

var score : int = 0

@onready var player: Player = $Player

func _ready() -> void:
	score = 0
	player.score_added.connect(add_score)
	player.player_died.connect(game_over)
	
	HighScoreTracker.load_high_score()

	if HighScoreTracker.high_score:
		$UI/HighScore_Label.text = str("High score: ", HighScoreTracker.high_score)
		
func add_score(amount) -> void:
	score += amount
	$UI/Score_Label.text = str(score)

func game_over():
	$Bone_Spawner.queue_free()
	$Background.stop()
	HighScoreTracker.check_score(score)
	$UI/GameOverScreen.visible = true
	$Sounds/GameOverSound.play()
	$UI/Score_Label.visible = false
	$UI/HighScore_Label.visible = false


func reset() -> void:
	get_tree().reload_current_scene()

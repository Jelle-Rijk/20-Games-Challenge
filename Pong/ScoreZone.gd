extends Area2D

signal respawn_ball()

@export var team_id: int # Team to which the score will be assigned.

func _on_body_entered(body):
	ScoreKeeper.add_score(team_id)
	await get_tree().create_timer(1).timeout
	body.queue_free()
	respawn_ball.emit()

extends Node2D

const BALL = preload("res://ball.tscn")

signal new_ball_spawned(ball)

func _ready():
	$ScoreZone.respawn_ball.connect(new_ball)
	$ScoreZone2.respawn_ball.connect(new_ball)
	new_ball()
	
func new_ball():
	var new_ball = BALL.instantiate()
	add_child(new_ball)
	new_ball_spawned.emit(new_ball)

extends CharacterBody2D

class_name Paddle
@export var is_AI: bool = false
@export var move_speed: float = 300
@export var player_ID: int
var ball: RigidBody2D

func _ready():
	global_position.y = get_viewport_rect().size.y / 2
	get_parent().new_ball_spawned.connect(get_new_ball)
	
func _physics_process(delta):
	if is_AI != true:
		if Input.is_action_pressed("moveUp_P1") and player_ID == 1:
			global_position += Vector2.UP * move_speed * delta
		if Input.is_action_pressed("moveDown_P1") and player_ID == 1: 
			global_position += Vector2.DOWN * move_speed * delta
		if Input.is_action_pressed("moveUp_P2") and player_ID == 2:
			global_position += Vector2.UP * move_speed * delta
		if Input.is_action_pressed("moveDown_P2") and player_ID == 2: 
			global_position += Vector2.DOWN * move_speed * delta
	else:
		if ball == null:
			return
		var position_difference = ball.global_position - global_position
		if position_difference[1] < -move_speed * delta * 10:
			global_position += Vector2.UP * move_speed * delta
		elif position_difference[1] > move_speed * delta * 10:
			global_position += Vector2.DOWN * move_speed * delta
	global_position.y = clamp(global_position.y, 70,577)

func get_new_ball(new_ball):
	ball = new_ball

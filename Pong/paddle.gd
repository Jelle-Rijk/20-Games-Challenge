extends CharacterBody2D

class_name Paddle
@export var is_AI: bool = false
@export var moveSpeed: float = 300
@export var player_ID: int

func _ready():
	global_position.y = get_viewport_rect().size.y / 2
	
func _physics_process(delta):
	if is_AI != true:
		if Input.is_action_pressed("moveUp_P1") and player_ID == 1:
			global_position += Vector2.UP * moveSpeed * delta
		if Input.is_action_pressed("moveDown_P1") and player_ID == 1: 
			global_position += Vector2.DOWN * moveSpeed * delta
		if Input.is_action_pressed("moveUp_P2") and player_ID == 2:
			global_position += Vector2.UP * moveSpeed * delta
		if Input.is_action_pressed("moveDown_P2") and player_ID == 2: 
			global_position += Vector2.DOWN * moveSpeed * delta
	global_position.y = clamp(global_position.y, 70,577)

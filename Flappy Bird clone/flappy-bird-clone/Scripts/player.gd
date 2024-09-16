extends CharacterBody2D
class_name Player

signal score_added(amount)
signal player_died()

@export var gravity : float = 10.0
@export var jump_force : float = 30.0
var score
var current_rotation : float = 0
@export var rotation_speed: float = 0.025

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("jump"):
		velocity.y = -jump_force

	else:
		velocity.y += gravity
	
	var target_rotation: float = 0
	if velocity.y < -5:
		target_rotation = -45
		$Sprite.play("thrust")
		if $ThrusterSound.playing == false:
			$ThrusterSound.play()
		current_rotation = lerp(current_rotation, target_rotation, rotation_speed * 4)
	elif velocity.y > 5:
		target_rotation = 30
		$Sprite.play("default")
		if $ThrusterSound.playing:
			$ThrusterSound.stop()
		current_rotation = lerp(current_rotation, target_rotation, rotation_speed)
	
	$Sprite.rotation_degrees = current_rotation

	move_and_slide()

func game_over():
	player_died.emit()
	queue_free()

func add_score(amount):
	score_added.emit(amount)
	$PointSound.play()

extends Node2D
class_name Bones

var gap_size: float = 128
var high_offset : float = -100
var low_offset : float = 100
var scroll_speed : float = 256
@onready var lower_bone: Area2D = $Lower_Bone
@onready var upper_bone: Area2D = $Upper_Bone

@onready var score_zone_shape: CollisionShape2D = $Score_Zone/CollisionShape2D

func _ready():
	$Upper_Bone.global_position.y -= (gap_size / 2)
	$Lower_Bone.global_position.y += (gap_size / 2)
	self.global_position.y += randf_range(high_offset, low_offset)
	score_zone_shape.shape.size.y = gap_size
	

func _process(delta: float) -> void:
	global_position.x -= scroll_speed * delta



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.game_over()

func _on_score_zone_body_entered(body: Node2D) -> void:
	if body is Player:
		body.add_score(1)

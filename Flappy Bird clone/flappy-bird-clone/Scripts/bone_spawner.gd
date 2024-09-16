extends Marker2D

const BONES = preload("res://Scenes/bones.tscn")
@export var high_offset : float = 100
@export var low_offset : float = 100
@export var gap_size : float = 128
@export var scroll_speed : float = 256


@export var min_wait_time : float = 1.0
@export var max_wait_time : float = 3.0

func _spawn_bones():
	var new_bones = BONES.instantiate()
	new_bones.high_offset = high_offset
	new_bones.low_offset = low_offset
	new_bones.gap_size = gap_size
	new_bones.scroll_speed = scroll_speed
	add_child(new_bones)


func _on_timer_timeout() -> void:
	$Timer.start(randf_range(min_wait_time, max_wait_time))
	_spawn_bones()

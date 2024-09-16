extends Area2D



func _on_area_entered(area: Area2D) -> void:
	var parent = area.get_parent()
	if parent is Bones:
		parent.queue_free()

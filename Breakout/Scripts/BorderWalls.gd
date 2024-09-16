extends StaticBody2D

@export var thickness : float = 5
@export var texture: GradientTexture1D
var width
var height
var camera_position

func _ready(): 
	var viewport_size = get_viewport_rect().size
	camera_position = get_viewport().get_camera_2d().transform.get_origin()
	width = viewport_size.x
	height = viewport_size.y
	var margin = thickness / 2

# REPLACE WITH COLLISIONPOLYGON
	
	create_collider(Vector2(0, -height / 2 + margin), width, thickness) # Top
	create_collider(Vector2(-width / 2 + margin, 0), thickness, height) # Left
	create_collider(Vector2(width / 2 - margin, 0), thickness, height) # Right
	
func create_collider(offset: Vector2, width, height):
	var collider : CollisionShape2D = CollisionShape2D.new()
	collider.global_position = camera_position + offset
	add_child(collider)
	var rect : RectangleShape2D = RectangleShape2D.new()
	rect.size = Vector2(width, height)
	collider.set_shape(rect)

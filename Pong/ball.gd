extends RigidBody2D

@export var speed: float = 300
@export var direction: Vector2

func _physics_process(delta):
	var collision = self.move_and_collide(Vector2(direction.x * speed * delta, direction.y * speed * delta))
	if collision is KinematicCollision2D:
		var collider = collision.get_collider()
		if collider is Paddle:
			print("Paddle collision")
			var collider_center = collider.global_position
			print(collider.global_position.y - global_position.y)
			var angle_offset = (collider.global_position.y - global_position.y) / 50
			direction.y = 1
			direction = direction * Vector2 (-1, -angle_offset)
		else:
			direction = direction * Vector2(1, -1)

extends RigidBody2D

@export var speed: float = 300
@export var direction: Vector2
const BOUNCE_PARTICLES = preload("res://bounce_particles.tscn")
var particles: GPUParticles2D

func _ready():
	particles = BOUNCE_PARTICLES.instantiate()
	add_child(particles)
	print("Spawned new ball.")
	self.global_position = get_viewport_rect().size / 2
	var random_number = randf()
	if random_number > 0.5:
		direction.x = 1
	else: 
		direction.x = -1
	direction.y = randf_range(-0.4,0.4)
	

func _physics_process(delta):
	var collision = self.move_and_collide(Vector2(direction.x * speed * delta, direction.y * speed * delta))
	if collision is KinematicCollision2D:
		particles.emitting = true
		var collider = collision.get_collider()
		if collider is Paddle:
			var collider_center = collider.global_position
			var angle_offset = (collider.global_position.y - global_position.y) / 50
			direction.y = 1
			direction = direction * Vector2 (-1, -angle_offset)
			speed += 10
		else:
			direction = direction * Vector2(1, -1)

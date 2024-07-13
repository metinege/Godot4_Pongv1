extends CharacterBody2D

var ball_direction : Vector2
var ball_speed : int = 350
var speed_increment : int = 50

func _on_ball_timer_timeout():
	ball_direction.x = randf_range(-0.3,0.3)
	ball_direction.y = randf_range(-0.3,0.3)
	ball_direction = ball_direction.normalized()

func _physics_process(delta):
	var movement = ball_direction * ball_speed * delta
	var collision = move_and_collide(movement)
	
	if collision:
		var normal = collision.get_normal()
		if collision.get_collider().is_in_group("paddles"):
			ball_speed += speed_increment
			
		ball_direction = ball_direction.bounce(normal)

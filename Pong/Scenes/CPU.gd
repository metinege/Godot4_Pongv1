extends CharacterBody2D

@onready var ball = $"../Ball"
var paddle_speed = 200

func _ready():
	add_to_group("paddles")

func _process(delta):
	var ball_position = ball.position.y
	var paddle_position = position.y - 210
	
	if ball_position < paddle_position:
		position.y -= paddle_speed * delta
	elif ball_position > paddle_position:
		position.y += paddle_speed * delta
	position.y = clamp(position.y, 35, 390)

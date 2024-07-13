extends Sprite2D

@onready var ball = $Ball
@onready var player_sign = $Hud/PlayerScore
@onready var cpu_sign = $Hud/CPUScore

var player_score :int = 0
var cpu_score : int = 0

func _ready():
	cpu_score -= 1
	print(player_sign.text)
	print(cpu_sign.text)

func _on_score_left_body_entered(body):
	cpu_score += 1
	cpu_sign.text = str(cpu_score)
	if cpu_score > 0:
		reset_ball()

func _on_score_right_body_entered(body):
	player_score += 1
	player_sign.text = str(player_score)
	reset_ball()

func reset_ball():
	ball.position = Vector2(0,0)
	ball.ball_speed = 0
	await get_tree().create_timer(1.0).timeout
	ball.ball_speed = 350
	ball.ball_direction.x = randf_range(-0.3,0.3)
	ball.ball_direction.y = randf_range(-0.3,0.3)
	ball.ball_direction = ball.ball_direction.normalized()

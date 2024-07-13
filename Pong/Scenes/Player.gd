extends StaticBody2D

var screen_width : int
var screen_height : int
var player_paddle_height : int

func _ready():
	add_to_group("paddles")
	screen_width = get_viewport_rect().size.x
	screen_height = get_viewport_rect().size.y
	player_paddle_height = $CollisionShape2D.get_viewport_rect().size.y

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= 5
	if Input.is_action_pressed("ui_down"):
		position.y += 5
	position.y = clamp(position.y, -180, 180)

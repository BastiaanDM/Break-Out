extends CharacterBody2D
var game_ended : bool = false
var physics : bool = true
var direction : float = 0.0
@export var SPEED : float = 300.0

signal pause

@onready var ball = $"../Ball"

func _process(delta):
	if(game_ended || !physics || !ball):
		return
	if Input.is_action_just_pressed("pause"):
			emit_signal("pause")
			physics = false
	var ball_x = ball.global_position.x
	var current_x = global_position.x
	direction = sign(ball_x - current_x)
	var new_x  = current_x + float(direction * SPEED) * delta
	if new_x < 193.82 || new_x > 958.17: 
		return
	var diff = ball_x - current_x
	if(abs(diff) < abs(new_x-current_x)):
		global_position.x = ball_x
		return
	global_position.x = new_x
	print(global_position.x)

func _on_ball_game_over(_score):
	game_ended = true


func _on_pause_menu_unpause():
	physics = true

extends CharacterBody2D

const speed = 50000.0
var physics = true
signal pause

func _ready():
	$CollisionShape2D.add_to_group("player")
	

func _physics_process(delta):
	if (physics):
		if Input.is_action_pressed("ui_left"):
			velocity.x = -speed*delta
		elif Input.is_action_pressed("ui_right"):
			velocity.x = speed*delta 
		velocity.y = 0
		move_and_slide()
		velocity.x = 0
		if Input.is_action_just_pressed("pause"):
			emit_signal("pause")
			physics = false

func _on_ball_game_over(_score):
	global_position.x = 540
	physics = false


func _on_pause_menu_unpause():
	physics = true

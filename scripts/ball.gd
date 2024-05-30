extends CharacterBody2D

const starting_speed = -300.0
var SPEED
var degree = randf_range(-PI/4,PI/4)
signal game_over
var score = 0
var physics = true

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(starting_speed*sin(degree),starting_speed*cos(degree))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(physics):
		var collision: KinematicCollision2D = move_and_collide(velocity * delta)
		if collision:
			$SoundEffect.play()
			var reflect = collision.get_remainder().bounce(collision.get_normal())
			velocity = velocity.bounce(collision.get_normal())
			move_and_collide(reflect)	
			if (collision.get_collider().get_class() == "CharacterBody2D"):
				score += 1
				velocity *= 1.07
		if global_position.y > 650:
			emit_signal("game_over", score)
			queue_free()


func _on_player_pause():
	physics = false


func _on_pause_menu_unpause():
	physics = true

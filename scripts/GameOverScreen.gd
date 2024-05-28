extends Control

@onready var scorelabel = $"Final score"

func _ready():
	pass

func _process(_delta):
	pass




func _on_ball_game_over(score):
	get_parent().set_physics_process(false)
	scorelabel.text = "Final Score: " + str(score)
	show()


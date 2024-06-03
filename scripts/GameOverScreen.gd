extends Control


func _ready():
	pass

func _process(_delta):
	pass




func _on_ball_game_over():
	get_parent().set_physics_process(false)
	show()


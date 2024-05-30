extends Node2D

@onready var menu =$PauseMenu
@onready var pause_timer = $PauseTimer
@onready var game_over_timer = $GameOverTimer

var level_music = load("res://assets/leap.mp3")

func _ready():
	MusicController.change_music(level_music)
	MusicController.change_volume(-15)
	pass

func _process(_delta):
	pass


func _on_player_pause():
	menu.show()
	pause_timer.start()





func _on_pause_timer_timeout():
	pause_timer.stop()


func _on_ball_game_over(_score):
	game_over_timer.start()


func _on_game_over_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

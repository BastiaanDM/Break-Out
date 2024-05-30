extends Node

var menu_music = load("res://assets/8bit-spaceshooter.mp3")
@onready var music = $Music

func _ready():
	pass
	
func play_music():
	change_volume(0)
	music.stream = menu_music
	music.play()

func change_music(filepath):
	music.stop()
	music.stream = filepath
	music.play()
	
func change_volume(value : float):
	music.volume_db = value

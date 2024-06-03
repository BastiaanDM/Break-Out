extends CanvasLayer

func _ready():
	MusicController.play_music()

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/classic/classic.tscn")


func _on_quit_button_pressed():
	get_tree().quit()


func _on_stats_button_pressed():
	get_tree().change_scene_to_file("res://scenes/classic/stats_page.tscn")

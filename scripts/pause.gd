extends CanvasLayer

signal unpause
var can_leave = false

func _process(_delta):
	if(can_leave):
		if (Input.is_action_just_pressed("pause")):
			emit_signal("unpause")
			can_leave = false
			hide()
			

func _on_return_button_pressed():
	if(can_leave):
		emit_signal("unpause")
		can_leave = false
		hide()
		
	

func _on_pause_timer_timeout():
	can_leave = true


func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_quit_button_pressed():
	get_tree().quit()

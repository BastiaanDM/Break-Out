extends Node

signal victory




func _on_child_exiting_tree(_node):
	if get_child_count() == 1:
		emit_signal("victory")

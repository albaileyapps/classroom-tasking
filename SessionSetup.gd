extends "res://scenes/SceneBase.gd"

onready var session_title_line_edit = $CanvasLayer/Control/VBoxContainer/SessionTitleLineEdit

signal start_session(p_title)


func _on_StartButton_pressed():
	var title = session_title_line_edit.text
	if title.length() > 0:
		emit_signal("start_session", title)


func _on_CancelButton_pressed():
	fade_out_and_remove(0.0, FADE_DURATION)

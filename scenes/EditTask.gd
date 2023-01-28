extends "res://scenes/SceneBase.gd"

var task

signal delete_task(task)

# Called when the node enters the scene tree for the first time.
func setup(p_task):
	task = p_task
	get_node("%TaskTitleEdit").text = task.title
	get_node("%DescriptionEdit").text = task.description
	

func _on_DeleteButton_pressed():
	emit_signal("delete_task", task)
	fade_out_and_remove(0.0, FADE_DURATION)
		
func _on_ExitButton_pressed():
	fade_out_and_remove(0.0, FADE_DURATION)
	task.save()
	emit_signal("remove_scene")

func _on_TitleEdit_text_changed(new_text):
	task.title = new_text

func _on_DescriptionEdit_text_changed():
	task.description = get_node("%DescriptionEdit").text


func _on_ExitButton2_pressed():
	fade_out_and_remove(0.0, FADE_DURATION)
	task.save()
	emit_signal("remove_scene")
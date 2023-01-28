extends "res://scenes/SceneBase.gd"

var task

# Called when the node enters the scene tree for the first time.
func setup(p_task):
	task = p_task
	set_labels()
	
func set_labels():
	get_node("%TitleLabel").text = task.title
	get_node("%DescriptionLabel").text = task.description

func _on_ExitButton_pressed():
	fade_out_and_remove(0.0, FADE_DURATION)
	emit_signal("remove_scene")

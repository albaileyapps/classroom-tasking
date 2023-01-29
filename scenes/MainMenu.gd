extends "res://scenes/SceneBase.gd"

var game_scene = preload("res://scenes/GameScene.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_EditTasksButton_pressed():
	SoundManager.play(SoundManager.CLICK)
	var scene = load("res://scenes/EditTasks.tscn").instance()
	scene.connect("remove_scene", self, "remove_child_and_fade_in", [scene])
	fade(0.0, 0.0, FADE_DURATION)
	add_child_scene(scene, FADE_DURATION, FADE_DURATION)

func _on_EditTeamsButton_pressed():
	SoundManager.play(SoundManager.CLICK)
	var scene = load("res://scenes/EditTeams.tscn").instance()
	scene.connect("remove_scene", self, "remove_child_and_fade_in", [scene])
	fade(0.0, 0.0, FADE_DURATION)
	add_child_scene(scene, FADE_DURATION, FADE_DURATION)
	
func _on_StartButton_pressed():
	SoundManager.play(SoundManager.CLICK)
	var scene = game_scene.instance()
	scene.connect("remove_scene", self, "remove_child_and_fade_in", [scene])
	fade(0.0, 0.0, FADE_DURATION)
	add_child_scene(scene, FADE_DURATION, FADE_DURATION)

func _on_HelpButton_pressed():
	SoundManager.play(SoundManager.CLICK)
	var title = "How To Use"
	var message = "Before your lesson, click Edit Tasks and choose a few tasks that are suitable for your classroom. You can create your own tasks by clicking 'Add Task'. \n\n Click 'Edit Teams' to enter your student/team names - you can edit this during the lesson. \n\nThen click the start button. Click one of the numbered buttons to select a task. Set and start the timer if you wish. \n\nWhen the task is over, assign points by clicking on a team and using the numbers on your keyboard."
	show_alert(title, message)

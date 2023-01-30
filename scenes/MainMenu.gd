extends "res://scenes/SceneBase.gd"

#var game_scene = preload("res://scenes/GameScene.tscn")
var tasks_default = preload("res://resources/tasks_default.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	load_saved_defaults()
	tasks_default.setup()
	tasks_default.connect("changed", self, "_on_tasks_default_changed")
	
func _on_tasks_default_changed():
	var error = ResourceSaver.save(Consts.TASKS_SAVED_DEFAULTS, tasks_default)
	print(error)

func _on_EditTasksButton_pressed():
	SoundManager.play(SoundManager.CLICK)
	var scene = load("res://scenes/EditTasks.tscn").instance()
	scene.setup(tasks_default)
	scene.connect("remove_scene", self, "remove_child_and_fade_in", [scene])
	fade(0.0, 0.0, FADE_DURATION)
	add_child_scene(scene, FADE_DURATION, FADE_DURATION)

func _on_EditTeamsButton_pressed():
	SoundManager.play(SoundManager.CLICK)
	var scene = load("res://scenes/EditTeams.tscn")
	scene.ssss(tasks_default)
#	scene.connect("remove_scene", self, "remove_child_and_fade_in", [scene])
	fade(0.0, 0.0, FADE_DURATION)
#	add_child_scene(scene, FADE_DURATION, FADE_DURATION)
	
func _on_StartButton_pressed():
#	SoundManager.play(SoundManager.CLICK)
#	var scene = game_scene.instance()
#	scene.connect("remove_scene", self, "remove_child_and_fade_in", [scene])
#	fade(0.0, 0.0, FADE_DURATION)
#	add_child_scene(scene, FADE_DURATION, FADE_DURATION)
	pass

func _on_HelpButton_pressed():
	SoundManager.play(SoundManager.CLICK)
	var title = "How To Use"
	var message = "Before your lesson, click Edit Tasks and choose a few tasks that are suitable for your classroom. You can create your own tasks by clicking 'Add Task'. \n\n Click 'Edit Teams' to enter your student/team names - you can edit this during the lesson. \n\nThen click the start button. Click one of the numbered buttons to select a task. Set and start the timer if you wish. \n\nWhen the task is over, assign points by clicking on a team and using the numbers on your keyboard."
	show_alert(title, message)

func load_saved_defaults():
	var saved = ResourceLoader.load(Consts.TASKS_SAVED_DEFAULTS)
	if saved is Tasks:
		tasks_default = saved
	

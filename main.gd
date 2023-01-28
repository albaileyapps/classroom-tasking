extends "res://scenes/SceneBase.gd"

#var tasks = preload("res://resources/tasks.tres")
#var teams = preload("res://resources/teams.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#this is the dir where user created tasks are stored, create it if it doesn't exist
	var dir = Directory.new()
	if !dir.dir_exists(Consts.TASK_SAVE_PATH):
		dir.make_dir(Consts.TASK_SAVE_PATH)
	if !dir.dir_exists(Consts.TEAM_SAVE_PATH):
		dir.make_dir(Consts.TEAM_SAVE_PATH)
		
#	currently the main menu scene is never removed - just hidden and shown
	var main_menu = load("res://scenes/MainMenu.tscn").instance()
	add_child_scene(main_menu, 0.0, 0.5)
	

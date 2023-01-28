extends "res://scenes/SceneBase.gd"

onready var show_hide_scores_button = $CanvasLayer/Control/HBoxContainer2/HBoxContainer/ShowHideScoresButton
onready var scoreboard = $CanvasLayer/Control/VBoxContainer/HBoxContainer/Scoreboard


var tasks = preload("res://resources/tasks.tres")
var task_button = preload("res://components/TaskButton.tscn")
var task_scene = preload("res://scenes/TaskScene.tscn")

var selected_task_button
var scoreboard_shown = true

# Called when the node enters the scene tree for the first time.
func _ready():
	var selected_tasks = []
	for task in tasks.list:
		if task.is_selected:
			selected_tasks.append(task)
	setup_button_grid(selected_tasks)

func setup_button_grid(p_selected_tasks):
	for i in p_selected_tasks.size():
		var btn = task_button.instance()
		btn.task = p_selected_tasks[i]
		btn.text = String(i + 1)
		btn.connect("pressed", self, "_on_task_button_pressed", [btn])
		get_node("%TaskButtonGrid").add_child(btn)
		
func _on_task_button_pressed(p_btn):
	print("task button pressed")
	var new_task_scene = task_scene.instance()
	new_task_scene.setup(p_btn.task)
	new_task_scene.connect("remove_scene", self, "_on_remove_task_scene", [p_btn])
#	fade(0.0, 0.0, FADE_DURATION)
	add_child_scene(new_task_scene, FADE_DURATION, FADE_DURATION)
		
func _on_remove_task_scene(p_btn):
	p_btn.animate_star()
	fade(1.0, FADE_DURATION, FADE_DURATION)
	

func _on_ExitButton_pressed():
	emit_signal("remove_scene")

func _on_EditTeamsButton_pressed():
	var scene = load("res://scenes/EditTeams.tscn").instance()
	scene.connect("remove_scene", self, "remove_edit_scene", [scene])
	add_child_scene(scene, 0.0, FADE_DURATION)
	
func remove_edit_scene(p_scene):
	p_scene.fade_out_and_remove(0.0, FADE_DURATION)

func _on_ShowHideScoresButton_pressed():
	scoreboard_shown = !scoreboard_shown
	scoreboard.visible = scoreboard_shown
	show_hide_scores_button.text = "Hide" if scoreboard_shown else "Show"
	


func _on_HelpButton_pressed():
	show_alert("SCORES", "Click on a team to select it. Use the number buttons on your keyboard to assign points to the selected team.")
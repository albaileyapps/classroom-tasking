extends Resource
class_name Tasks

class CustomSorterTask:
	static func sort(a: Task, b: Task):
		if a.date_created > b.date_created:
			return true
		return false

var list = []

# Called when the node enters the scene tree for the first time.
func _init():
	print("tasks init")
	load_tasks()
	list.sort_custom(CustomSorterTask, "sort")
	
func add_task(p_task):
	list.push_front(p_task)
	emit_changed()
	
func remove_task(p_task):
	list.erase(p_task)
	var dir = Directory.new()
	dir.remove(Consts.TASK_SAVE_PATH + String(p_task.id) + ".tres")
	emit_changed()

func load_tasks():
	print("loading tasks...")
	var dir = Directory.new()
	if dir.open(Consts.TASK_SAVE_PATH) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				if file_name.ends_with(".tres"):
					print("found a saved task")
					var task = ResourceLoader.load(Consts.TASK_SAVE_PATH + file_name)
					list.append(task)
			file_name = dir.get_next()
	if list.size() == 0:
		load_default_tasks()
		
func load_default_tasks():
	var dir = Directory.new()
	if dir.open(Consts.TASK_DEFAULT_PATH) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				if file_name.ends_with(".tres"):
					var task = ResourceLoader.load(Consts.TASK_DEFAULT_PATH + file_name)
					task.save()
					list.append(task)
			file_name = dir.get_next()
			emit_changed()
			

extends Resource
class_name Teams


var list = []


# Called when the node enters the scene tree for the first time.
func _init():
	load_teams()

func add_team(p_team):
	list.push_front(p_team)
	emit_changed()
	
func remove_team(p_team):
	list.erase(p_team)
	var dir = Directory.new()
	dir.remove(Consts.TEAM_SAVE_PATH + String(p_team.id) + ".tres")
	emit_changed()
	
func load_teams():
	var dir = Directory.new()
	if dir.open(Consts.TEAM_SAVE_PATH) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				if file_name.ends_with(".tres"):
					var team = ResourceLoader.load(Consts.TEAM_SAVE_PATH + file_name)
					list.append(team)
			file_name = dir.get_next()
	if list.size() == 0:
		load_default_teams()
	
func load_default_teams():
	print("loading default teams")
	var dir = Directory.new()
	if dir.open(Consts.TEAM_DEFAULT_PATH) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				if file_name.ends_with(".tres"):
					var team = ResourceLoader.load(Consts.TEAM_DEFAULT_PATH + file_name)
					print("load default team: ", Consts.TEAM_DEFAULT_PATH + file_name)
					print(team)
					team.save()
					list.append(team)
			file_name = dir.get_next()
			emit_changed()

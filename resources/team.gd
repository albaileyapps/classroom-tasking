extends Resource
class_name Team

export var id: String = ""
export var team_name: String = "" setget set_team_name, get_team_name
export var score: int = 0 setget set_score, get_score

#overriding _init must have default values set for all args for ResourceSaver/Loader to work properly
func _init(p_id = "", p_name = "", p_score = 0):
	print("init team")
	id = p_id
	team_name = p_name
	score = p_score

func set_team_name(p_val):
	team_name = p_val
	emit_changed()

func get_team_name():
	return team_name
	
func set_score(p_val):
	score = p_val
	emit_changed()
	
func get_score():
	return score
	
func save():
	var error = ResourceSaver.save(Consts.TEAM_SAVE_PATH + id + ".tres", self)

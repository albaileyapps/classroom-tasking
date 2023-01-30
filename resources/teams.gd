extends Resource
class_name Teams

class CustomSorterTeam:
	static func sort(a: Team, b: Team):
		if a.date_created > b.date_created:
			return true
		return false

export var list = []

# Called when the node enters the scene tree for the first time.
func _init():
	list.sort_custom(CustomSorterTeam, "sort")

func add_team(p_team):
	list.push_front(p_team)
	emit_changed()
	
func remove_team(p_team):
	list.erase(p_team)
	var dir = Directory.new()
	dir.remove(Consts.TEAM_SAVE_PATH + String(p_team.id) + ".tres")
	emit_changed()
	

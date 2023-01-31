extends HBoxContainer

onready var start_session_button  = $StartSessionButton
signal session_selected(p_id)
signal session_deleted(p_session_item)

var id: String
var title: String

# Called when the node enters the scene tree for the first time.
func _ready():
	start_session_button.text = title

func setup(p_id, p_title):
	id = p_id
	title = p_title

func _on_StartSessionButton_pressed():
	emit_signal("session_selected", id)


func _on_DeleteButton_pressed():
	emit_signal("session_deleted", self)

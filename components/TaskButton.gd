extends Button

var task

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func animate_star():
	text = ""
	var tween = create_tween()
	tween.parallel().tween_property($Star.get_material(), "shader_param/amount", 2*PI, 1.0).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property($Star, "modulate:a", 1.0, 0.2)
	

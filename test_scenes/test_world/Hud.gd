extends CanvasLayer
class_name Hud

func set_score_counter(value: int):
	$Score.text = var_to_str(value)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

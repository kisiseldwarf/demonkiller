extends CanvasLayer
class_name Hud

func set_score_counter(value: int):
	$HUD/Score.text = var_to_str(value)

func set_life(life: int):
	_set_life(life)

func _set_life(life: int):
	$HUD/TextureProgressBar.value = life

func show_game_over():
	_show_game_over()

func _show_game_over():
	$GameOver.show_game_over()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

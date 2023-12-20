extends Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func show_game_over():
	get_tree().paused = true
	$"Score".text = "Votre score est de " + str(Global.score)
	$"../HUD".hide()
	show()

func retry():
	get_tree().paused = false
	get_tree().reload_current_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

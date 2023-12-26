extends Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func show_game_over():
	get_tree().paused = true
	$"Score".text = "Votre score est de " + str(Global.score)
	$"Wave".text = "Vous êtes mort à la vague " + str(Global.wave)
	$"../HUD".hide()
	show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

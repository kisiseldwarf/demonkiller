extends Panel

signal _game_retried

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func show_game_over():
	get_tree().paused = true
	$"Score".text = "Votre score est de " + str(Global.score)
	$"Wave".text = "Vous êtes mort à la vague " + str(Global.wave)
	$"../HUD".hide()
	show()

func retry():
	_game_retried.emit()
	for node in get_tree().get_nodes_in_group("enemy"):
		node.queue_free()
	get_tree().paused = false
	get_tree().reload_current_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

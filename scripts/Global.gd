extends Node

var score = 0

@onready var hud = maybe_get_hud()

func increase_score(n: int):
	score = score + n
	if hud != null:
		hud.set_score_counter(score)

func maybe_get_hud() -> Hud:
	var hud = get_tree().get_first_node_in_group("Hud")
	if (hud == null):
		print_debug("HUD not found !")
	return hud

func maybe_get_player() -> Player:
	var player = get_tree().get_first_node_in_group("Player")
	if (player == null):
		print_debug("Player cannot be found")
	return player

# Called when the node enters the scene tree for the first time.
func _ready():
	if (hud != null):
		hud.set_score_counter(score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

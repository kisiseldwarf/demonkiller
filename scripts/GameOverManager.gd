extends Node

@onready var hud = Global.maybe_get_hud()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func show_game_over():
	if (hud != null):
		hud.show_game_over()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

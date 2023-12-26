extends Node

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(e):
	if Input.is_action_just_pressed("pause"):
		var hud = Global.maybe_get_hud()
		var tree = get_tree()
		tree.paused = !tree.paused
		hud.show_hud(!tree.paused)
		hud.pause_screen_display(tree.paused)

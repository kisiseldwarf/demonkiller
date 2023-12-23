extends Timer
class_name Waver

@onready var hud = Global.maybe_get_hud()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (hud != null):
		hud.set_time_text("%.2f" % time_left)

func _on_timeout():
	Global.new_wave();

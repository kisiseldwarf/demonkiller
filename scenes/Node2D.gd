extends Node2D

@onready var parent_node = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cos(deg_to_rad(parent_node.rotation_degrees)) < 0.0:
		scale.y = -1 * abs(scale.y)
	else :
		scale.y = 1  * abs(scale.y)

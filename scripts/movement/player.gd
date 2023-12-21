extends CharacterBody2D

class_name Player

@export var speed = 500.0
@export var life = 100.0
@export var damage = 10.0
@onready var hud = Global.maybe_get_hud()

var direction : Vector2

func _process(_delta):
	pass

func _physics_process(_delta):
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()

func _on_killed():
	if hud != null:
		hud.show_game_over()

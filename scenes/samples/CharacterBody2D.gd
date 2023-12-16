extends Node2D

@export var life = 20.0
@export var damage = 25.0
@export var SPEED = 30.0
@export var score = 1
@onready var player = get_tree().get_first_node_in_group("Player")

var velocity = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player_pos = Vector2.ZERO

func _physics_process(delta):
	var direction = get_player_direction()
	velocity = direction.normalized() * SPEED
	self.position = self.position + velocity * delta;

func get_player_direction() -> Vector2:
	return get_tree().get_first_node_in_group("Player").position - self.position

func hit(damage):
	print("Hit !")
	life = life - damage
	if (life <= 0):
		die()

func die():
	Global.increase_score(score)
	queue_free()

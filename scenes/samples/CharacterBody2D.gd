extends CharacterBody2D

@export var life = 20.0
@export var damage = 25.0
@export var SPEED = 30.0
@export var PROJECTION_SPEED = 100.0
@export var score = 1
@onready var player = get_tree().get_first_node_in_group("Player")

var direction: Vector2
var projected = false
var projection_direction: Vector2
var player_pos = Vector2.ZERO

func _physics_process(delta):
	if projected == false:
		direction = get_player_direction().normalized()
		velocity = direction * SPEED
	else:
		direction = self.projection_direction.normalized()
		velocity = direction * PROJECTION_SPEED
	move_and_slide()

func get_player_direction() -> Vector2:
	return player.position - self.position

func hit(damage, projection_direction = Vector2.ZERO):
	print("Hit !")
	project(projection_direction)
	life = life - damage
	if (life <= 0):
		die()

func project(projection_direction):
	$ProjectionTimer.start()
	self.projection_direction = projection_direction
	projected = true
	await $ProjectionTimer.timeout
	projected = false

func die():
	Global.increase_score(score)
	queue_free()

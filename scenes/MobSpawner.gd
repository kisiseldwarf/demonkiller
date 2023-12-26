extends Area2D

class_name MobSpawner


@onready var enemy = preload("res://scenes/enemy_cac.tscn");
@onready var player = Global.maybe_get_player()

# @export var spawn_rate = 2.0
@export var spawn_rate: float = 2.0:
	get:
		return spawn_rate
	set(value):
		spawn_rate = value
		$TimerSpawner.wait_time = 1.0 / spawn_rate

@export var enemies_dmg = 25.0

var spawnArea
var origin

func pause():
	$TimerSpawner.stop()

func resume():
	$TimerSpawner.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	if (get_node("CollisionShape2D") == null):
		print_debug("No collision shape 2D for mob spawner. Disabling.")
		return
	spawnArea = $CollisionShape2D.shape.get_rect()
	origin = spawnArea.position + position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func point_comprised_inside_x_boundaries(point, epsilon):
	return point.x >= player.position.x - epsilon && point.x <= player.position.x + epsilon

func point_comprised_inside_y_boundaries(point, epsilon):
	return point.y >= player.position.y - epsilon && point.y <= player.position.y + epsilon

func point_is_close_to_player(point, epsilon):
	return point_comprised_inside_x_boundaries(point, epsilon) && point_comprised_inside_y_boundaries(point, epsilon)

func spawnerTimeout():
	print("spawn")
	var point = Vector2(randf_range(origin.x, origin.x + spawnArea.size.x), randf_range(origin.y, origin.y + spawnArea.size.y))
	if (point_is_close_to_player(point, 5.0)):
		point += Vector2(10,0)
	print("spawn " + str(point))
	var enemy_instance: Enemy = enemy.instantiate()
	enemy_instance.damage = enemies_dmg
	get_tree().root.add_child(enemy_instance)
	enemy_instance.position = point

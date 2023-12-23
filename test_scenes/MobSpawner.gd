extends Area2D

class_name MobSpawner

var spawnArea
@onready var origin
@onready var enemy = preload("res://enemy.tscn");
@export var spawn_rate = 1.0
@export var enemies_dmg = 25.0

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
	$TimerSpawner.wait_time = 1 / spawn_rate

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawnerTimeout():
	print("spawn")
	var point = Vector2(randf_range(origin.x, origin.x + spawnArea.size.x), randf_range(origin.y, origin.y + spawnArea.size.y))
	print("spawn " + str(point))
	var enemy_instance: Enemy = enemy.instantiate()
	enemy_instance.damage = enemies_dmg
	get_tree().root.add_child(enemy_instance)
	enemy_instance.position = point

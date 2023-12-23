extends Node

enum GamePhase {WAVE, IN_BETWEEN_WAVE}

var current_game_phase = GamePhase.WAVE
var score = 0
var wave = 0

@onready var hud = maybe_get_hud()
@onready var mob_spawner = maybe_get_mob_spawner()
@onready var waver = maybe_get_waver()

func maybe_get_mob_spawner() -> MobSpawner:
	var mob_spawner = get_tree().get_first_node_in_group("MobSpawner")
	if (mob_spawner == null):
		print_debug("Mob Spawner not found !")
	return mob_spawner

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

func in_between_wave():
	return current_game_phase == GamePhase.IN_BETWEEN_WAVE

func next_wave():
	current_game_phase = GamePhase.WAVE
	if (mob_spawner != null):
		mob_spawner.resume()
	waver.start()

func maybe_get(groupName: String):
	var res = get_tree().get_first_node_in_group(groupName)
	if (res == null):
		print_debug("Cannot find %s" % groupName)
	return res

func maybe_get_waver() -> Waver:
	return maybe_get("Waver")

func new_wave():
	wave = wave + 1
	for node in get_tree().get_nodes_in_group("enemy"):
		node.queue_free()
	if (mob_spawner != null):
		mob_spawner.pause()
		mob_spawner.spawn_rate += 5
	if (hud != null):
		hud.set_wave_count("Wave Count : %s" % wave)
		hud.show_continue_wave()
	current_game_phase = GamePhase.IN_BETWEEN_WAVE

func maybe_get_player_camera() -> Camera2D:
	var player = maybe_get_player()
	if (player != null):
		return player.get_camera()
	return null

# Called when the node enters the scene tree for the first time.
func _ready():
	if (hud != null):
		hud.set_score_counter(score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

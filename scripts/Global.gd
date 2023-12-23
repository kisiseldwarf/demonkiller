extends Node

enum GamePhase {WAVE, IN_BETWEEN_WAVE}

enum WaveModificator {MORE_ENEMIES, MORE_DMG}

var current_game_phase = GamePhase.WAVE
var next_wave_modificator = null
var score = 0
var wave = 0

# percentage
var frenzyModifer = 3
var hordeModifer = 3

@onready var hud = maybe_get_hud()
@onready var mob_spawner = maybe_get_mob_spawner()
@onready var waver = maybe_get_waver()


func maybe_get(groupName: String):
	var res = get_tree().get_first_node_in_group(groupName)
	if (res == null):
		print_debug("Cannot find %s" % groupName)
	return res

func maybe_get_mob_spawner() -> MobSpawner:
	return maybe_get("MobSpawner")

func maybe_get_hud() -> Hud:
	return maybe_get("Hud")

func maybe_get_player() -> Player:
	return maybe_get("Player")

func maybe_get_player_camera() -> Camera2D:
	var player = maybe_get_player()
	if (player != null):
		return player.get_camera()
	return null

func in_between_wave():
	return current_game_phase == GamePhase.IN_BETWEEN_WAVE

func next_wave():
	current_game_phase = GamePhase.WAVE
	if (mob_spawner != null):
		mob_spawner.resume()
	waver.start()

func maybe_get_waver() -> Waver:
	return maybe_get("Waver")
	
func increase_score(n: int):
	score = score + n
	if hud != null:
		hud.set_score_counter(score)

func new_wave():
	wave = wave + 1
	for node in get_tree().get_nodes_in_group("enemy"):
		node.queue_free()
	next_wave_modificator = WaveModificator.values()[randi() % WaveModificator.size()]
	if (mob_spawner != null):
		mob_spawner.pause()
		if (next_wave_modificator == WaveModificator.MORE_ENEMIES):
			mob_spawner.spawn_rate += mob_spawner.spawn_rate * hordeModifer
		if (next_wave_modificator == WaveModificator.MORE_DMG):
			mob_spawner.enemies_dmg += mob_spawner.enemies_dmg * frenzyModifer
	if (hud != null):
		hud.set_wave_count("Wave Count : %s" % wave)
		hud.show_new_wave_hud(next_wave_modificator)
	current_game_phase = GamePhase.IN_BETWEEN_WAVE

# Called when the node enters the scene tree for the first time.
func _ready():
	if (hud != null):
		hud.set_score_counter(score)
		hud.set_wave_count("Wave Count : %s" % wave)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

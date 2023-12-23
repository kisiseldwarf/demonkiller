extends CanvasLayer
class_name Hud

func set_score_counter(value: int):
	$HUD/Score.text = var_to_str(value)

func set_time_text(value: String):
	_set_time_text(value)

func _set_time_text(value: String):
	$HUD/Time.text = value

func set_life(life: int):
	_set_life(life)

func _set_life(life: int):
	$HUD/TextureProgressBar.value = life

func show_game_over():
	_show_game_over()

func _show_game_over():
	$GameOver.show_game_over()

func show_new_wave_hud(modificator: Global.WaveModificator):
	_set_next_wave_modificator_text(modificator)
	$HUD/WaveHud.show()

func _set_next_wave_modificator_text(modificator: Global.WaveModificator):
	if (modificator == Global.WaveModificator.MORE_DMG):
		$HUD/WaveHud/NextWaveModificatorDisplay/Modificator.text = "Frenzy (+ 50% DMG)"
	if (modificator == Global.WaveModificator.MORE_ENEMIES):
		$HUD/WaveHud/NextWaveModificatorDisplay/Modificator.text = "Horde (+ 50% DEMONS)"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("continue_wave") and Global.in_between_wave()):
		$HUD/WaveHud.hide()
		Global.next_wave()

func _on_quit_pressed():
	get_tree().quit()

func set_wave_count(value: String): 
	_set_wave_count(value)

func _set_wave_count(value: String):
	$HUD/WaveCount.text = value

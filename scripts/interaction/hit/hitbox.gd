class_name HitBox extends BaseHitBox

@export var hp : float = 100
@onready var hud: Hud = Global.maybe_get_hud()

func _ready():
	if hud != null:
		hud.set_life(hp)

func on_hit(damage : float):
	super(damage)

func _get_hp():
	return hp

func _set_hp(health):
	if hud != null:
		hud.set_life(health)
	hp = health

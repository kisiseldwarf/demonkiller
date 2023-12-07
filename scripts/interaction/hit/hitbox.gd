class_name HitBox extends BaseHitBox

@export var hp : float = 100

func on_hit(damage : float):
	print(hp)
	super(damage)

func _get_hp():
	return hp
	
func _set_hp(health):
	hp = health

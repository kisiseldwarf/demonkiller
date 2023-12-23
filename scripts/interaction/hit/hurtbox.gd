extends Area2D

class_name HurtBox

@export var damage: int
@export var damage_window: int

@onready var damageTimer = $"DamageTimer"

func _ready():
	damageTimer.wait_time = damage_window
	damageTimer.timeout.connect(hit.bind())
	area_entered.connect(on_hit);
	area_exited.connect(no_on_hit)

func hit():
	for area in get_overlapping_areas():
		if area is HitBox:
			area.on_hit(damage)

func on_hit(area : Area2D):
	damageTimer.start()
	if area is HitBox:
		area.on_hit(damage)

func no_on_hit(area: Area2D):
	damageTimer.stop()

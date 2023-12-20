extends Area2D

class_name HurtBox

var damage: int

func _ready():
	damage = $"..".damage
	area_entered.connect(on_hit);

func on_hit(area : Area2D):
	if area is HitBox:
		area.on_hit(damage)

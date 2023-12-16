class_name Sword extends Node2D

@export_group("Effects") 
@export var shoot_effects : Array[EmptyEffect]

func _input(event):
	if not event.is_action_pressed("attack") : return
	
	

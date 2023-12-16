extends Node2D

var is_attacking: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.monitoring = false

func attack():
	$Area2D.monitoring = true
	is_attacking = true
	$Sprite2D.play()
	$AttackTimer.start()
	await $AttackTimer.timeout
	$Area2D.monitoring = false
	is_attacking = false

func _input(input):
	if Input.is_action_just_pressed("attack"):
		attack()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (is_attacking): return
	
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)

func attack_hitbox(collider: Node2D):
	print("wtf")
	if (collider.is_in_group('attackable')):
		collider.hit(get_parent().damage, collider.position - get_parent().position)

extends Node2D

var is_attacking: bool
var attack_combo_list: Array
enum AttackType {A, B, C, D}

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.monitoring = false

func attack(attackType: AttackType):
	$ComboTimer.start()
	attack_combo_list.push_back(attackType)
	print(attack_combo_list)
	$Area2D.monitoring = true
	is_attacking = true
	$Sprite2D.play()
	$AttackTimer.start()
	await $AttackTimer.timeout
	$Area2D.monitoring = false
	is_attacking = false

func _input(input):
	if Input.is_action_just_pressed("attack_a"):
		attack(AttackType.A)
	if Input.is_action_just_pressed("attack_b"):
		attack(AttackType.B)
	if Input.is_action_just_pressed("attack_c"):
		attack(AttackType.C)
	if Input.is_action_just_pressed("attack_d"):
		attack(AttackType.D)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (is_attacking): return
	
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)

func attack_hitbox(collider: Node2D):
	if (collider.is_in_group('attackable')):
		collider.hit(get_parent().damage, collider.position - get_parent().position)

func _on_combo_timer_timeout():
	attack_combo_list.clear()

extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func attack():
	show()
	$Node2D/Sprite2D.play()
	$AttackTimer.start()
	await $AttackTimer.timeout
	$Node2D/Sprite2D.stop()
	hide()

func _input(input):
	if Input.is_action_just_pressed("attack"):
		attack()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	look_at(mouse_pos)

func attack_hitbox(collider: Node2D):
	if (collider.is_in_group('attackable')):
		collider.hit(get_parent().damage)

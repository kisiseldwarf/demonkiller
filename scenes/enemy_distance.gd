extends CharacterBody2D

class_name EnemyDistance


@export var life = 20.0
@export var damage = 25.0
@export var SPEED = 30.0
@export var PROJECTION_SPEED = 100.0
@export var score = 1
@export var attack_speed = 1.0

@onready var player: Player = get_tree().get_first_node_in_group("Player")
@onready var hud: Hud = Global.maybe_get_hud()
@onready var thunder_ball = preload("res://scenes/thunder_ball.tscn")

var direction: Vector2
var projected = false
var projection_direction: Vector2
var player_pos = Vector2.ZERO

func _ready():
	$HurtBox.damage_window = attack_speed
	$HurtBox.damage = damage

func _physics_process(delta):
	move_and_slide()

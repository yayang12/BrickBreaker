extends CharacterBody2D

class_name Ball

const VELOCITY_LIMIT = 40

@export var ball_speed = 20
@export var lives = 3
@export var death_zone: DeathZone
@export var ui: UI

var speed_up_factor = 1.05 

@onready var collision_shape_2d = $CollisionShape2D

var start_position: Vector2

func _ready():
	
	start_position = position
	death_zone.life_lost.connect(on_life_lost)

func _physics_process(delta):
	var collision = move_and_collide(velocity * ball_speed * delta)
	if (!collision):
		return
		
	velocity = velocity.bounce(collision.get_normal())
	
func start_ball():
	ui.set_lives(lives)
	position = start_position
	randomize()
	
	velocity = Vector2(randf_range(-1,1), randf_range(-.1, -1)).normalized() * ball_speed

func on_life_lost():
	lives -= 1
	if lives == 0:
		pass
		#ui.game_over()
	else:
		reset_ball()
		ui.set_lives(lives)
		
func reset_ball():
	position = start_position
	velocity = Vector2.ZERO
	
		

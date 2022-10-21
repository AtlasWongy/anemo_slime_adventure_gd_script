extends KinematicBody2D


var motion = Vector2()
var x
var facingRight
onready var physics_constant_load = load("res://scripts/anemo_slime_adventure_gd_script/Player/player_constants.gd")
var physics_constant

func _ready():
	physics_constant = physics_constant_load.new()

func _physics_process(_delta):
	Gravity()
	Walking()
	FlipTheSprite()
	Jumping()
	motion = move_and_slide(motion, physics_constant.UP)

func Walking():

	x = Input.get_axis("key_left", "key_right")

	if x != 0 :
		motion.x += x * physics_constant.ACCELERATION
		motion.x = clamp(motion.x, -physics_constant.MOVE_SPEED, physics_constant.MOVE_SPEED)
	else:
		motion.x = lerp(motion.x, 0, 0.2)

func Gravity():
	motion.y += physics_constant.GRAVITY
	if motion.y > physics_constant.MAX_FALL_SPEED:
		motion.y = physics_constant.MAX_FALL_SPEED

func Jumping():
	if is_on_floor() && Input.is_action_pressed("jump"):
		motion.y = - physics_constant.JUMP_FORCE

func FlipTheSprite():
	if facingRight and x > 0:
		facingRight = true
		$inner.scale.x = -1 * $inner.scale.x
	elif not facingRight and x < 0:
		facingRight = false
		$inner.scale.x = -1 * $inner.scale.x

extends KinematicBody2D

var UP = Vector2(0, -1)
var JUMP_VELOCITY = -1000
var MOVE_VELOCITY = 300
var velocity = Vector2()
var can_jump = true

signal dead

func boost_up():
	$BoostTimer.start()
	MOVE_VELOCITY = 2 * MOVE_VELOCITY
	velocity.y *= 2

func throw():
	velocity.y = -1500

func throw_left():
	velocity.y = -1500
	velocity.x = -400

func throw_right():
	velocity.y = -1500
	velocity.x = 400

func kill():
	print("shit")
	emit_signal("dead")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# warning-ignore:unused_argument
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		velocity.x = -MOVE_VELOCITY
	if Input.is_action_pressed("ui_right"):
		velocity.x = MOVE_VELOCITY
	if Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right"):
		velocity.x = 0

	
	if is_on_floor():
		#print("floor")
		if Input.is_action_just_pressed("ui_up") and can_jump:
			velocity.y = JUMP_VELOCITY
			can_jump = false
	
	velocity.y += 30
	
	
	velocity = move_and_slide(velocity, UP)

func _on_BoostTimer_timeout():
	MOVE_VELOCITY = 300

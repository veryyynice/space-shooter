extends KinematicBody2D

export (int) var speed = 350

var velocity = Vector2()
signal move
var is_moving = Input.is_action_pressed("down") or Input.is_action_pressed("up")or Input.is_action_pressed("left") or Input.is_action_pressed("right")
func get_input():
	
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	move_and_slide(velocity)
	if is_moving:
		emit_signal("move")


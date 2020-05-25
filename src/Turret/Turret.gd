extends StaticBody2D


var can_shoot:= true


export var rotate_speed:= 90
export var turret_shot: PackedScene

onready var pointer:= $Pointer
onready var ray:= $Pointer/RayCast2D
onready var shot_timer:= $ShotTimer


func _ready():
	pointer.rotation_degrees = 90
	pass # Replace with function body.


func _process(delta):
	shoot()
	if pointer.rotation_degrees > 295:
		rotate_speed = - rotate_speed
	if pointer.rotation_degrees < 65:
		rotate_speed = - rotate_speed
	pointer.rotation_degrees += rotate_speed * delta
	


func shoot()->void:
	if can_shoot and ray.is_colliding():
		if ray.get_collider().is_in_group("Player"):
			can_shoot = false
			shot_timer.start()
			var temp = turret_shot.instance()
			add_child(temp)
			temp.global_position = global_position
			temp.rotation_degrees = pointer.rotation_degrees + 90
			temp.setup(ray.get_collision_point() - position)


func _on_ShotTimer_timeout():
	can_shoot = true




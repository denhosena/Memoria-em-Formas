extends KinematicBody
class_name Player

export var move_speed : float = 10.0
export var rotate_speed : float = 3.0

func _physics_process(delta):
	var z_movement = Input.get_action_strength("backward") - Input.get_action_strength("forward");
	var rotate = Input.get_action_strength("left") - Input.get_action_strength("right")
	
	rotation.y += rotate * rotate_speed * delta
	var direction = Vector3(0,0,1).rotated(Vector3(0,1,0), rotation.y)
	var motion = direction * z_movement * delta * move_speed
	move_and_collide(motion)

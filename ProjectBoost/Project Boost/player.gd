extends RigidBody3D

@export var speed : float = 1000.0
@export var torque_z_axis : float = 100.0

func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		apply_central_force(basis.y * delta * speed)
	
	if Input.is_action_pressed("rotate_left"):
		apply_torque(Vector3(0.0,0.0, torque_z_axis * delta))
	elif Input.is_action_pressed("rotate_right"):
		apply_torque(Vector3(0.0,0.0,-torque_z_axis * delta))
	pass


func _on_body_entered(body: Node) -> void:
	pass # Replace with function body.

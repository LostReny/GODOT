extends RigidBody3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_physical_key_pressed(KEY_SPACE):
		apply_central_force(Vector3.UP)
	
	if Input.is_action_pressed("ui_left"):
		rotate_z(delta)
	elif Input.is_action_pressed("ui_right"):
		rotate_z(-delta)
	pass

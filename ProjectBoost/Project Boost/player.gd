extends Node3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_physical_key_pressed(KEY_SPACE):
		position.y += delta
	
	if Input.is_action_pressed("ui_left"):
		rotate_z(delta)
	elif Input.is_action_pressed("ui_right"):
		rotate_z(-delta)
	pass

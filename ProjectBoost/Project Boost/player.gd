extends RigidBody3D

## How much vertical force apply when moving
@export_range(750.0,3000.0) var force : float = 1000.0

## How much rotational force apply on Z axis
@export var torque_force : float = 100.0

var is_transitioning: bool = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		apply_central_force(basis.y * delta * force)
	
	if Input.is_action_pressed("rotate_left"):
		apply_torque(Vector3(0.0,0.0, torque_force * delta))
	elif Input.is_action_pressed("rotate_right"):
		apply_torque(Vector3(0.0,0.0,-torque_force * delta))
	pass


func _on_body_entered(body: Node) -> void:
	if is_transitioning == false:
		if "Goal" in body.get_groups():
			complete_level(body.langing_path)
		elif "Ground" in body.get_groups():
			crash_sequence()
	pass
	
# when the player collides with the ground
func crash_sequence() -> void:
	print("kabbom!")
	set_process(false)
	is_transitioning = true
	var tween = create_tween()
	tween.tween_interval(1.0)
	tween.tween_callback(get_tree().reload_current_scene)
	pass
	
# function when the player collides with the landing pad
func complete_level(next_level_file: String) -> void:
	print("Level Complete!")
	set_process(false)
	is_transitioning = true
	var tween = create_tween()
	tween.tween_interval(1.0)
	tween.tween_callback(get_tree().change_scene_to_file.bind(next_level_file))
	pass

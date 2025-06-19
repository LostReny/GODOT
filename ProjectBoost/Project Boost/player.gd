extends RigidBody3D

## How much vertical force apply when moving
@export_range(750.0,3000.0) var force : float = 1000.0

## How much rotational force apply on Z axis
@export var torque_force : float = 100.0

#variable that will be called when _ready function start
#Sound
@onready var explosion_audio: AudioStreamPlayer = $ExplosionAudio
@onready var sucess_audio: AudioStreamPlayer = $SucessAudio
@onready var rocket_audio: AudioStreamPlayer3D = $RocketAudio
#VFX
@onready var booster_particles: GPUParticles3D = $BoosterParticles
@onready var right_booster_particles : GPUParticles3D = $RightBoosterParticles
@onready var left_booster_particles: GPUParticles3D = $LeftBoosterParticles
@onready var explosion_particles: GPUParticles3D = $ExplosionParticles
@onready var success_particles: GPUParticles3D = $SuccessParticles

# mesh
#@onready var mesh_instance_3d = $MeshInstance3D

var is_transitioning: bool = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		apply_central_force(basis.y * delta * force)
		booster_particles.emitting = true
		if rocket_audio.playing == false:
			rocket_audio.play()
	else:
		booster_particles.emitting = false
		rocket_audio.stop()
		
	if Input.is_action_pressed("rotate_left"):
		apply_torque(Vector3(0.0,0.0, torque_force * delta))
		right_booster_particles.emitting = true
	elif Input.is_action_pressed("rotate_right"):
		apply_torque(Vector3(0.0,0.0,-torque_force * delta))
		left_booster_particles.emitting = true
	else:
		right_booster_particles.emitting = false
		left_booster_particles.emitting = false
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
	explosion_particles.emitting = true
	#mesh_instance_3d.visible = false
	booster_particles.emitting = false
	right_booster_particles.emitting = false
	left_booster_particles.emitting = false
	rocket_audio.stop()
	explosion_audio.play()
	set_process(false)
	is_transitioning = true
	var tween = create_tween()
	tween.tween_interval(2.5)
	tween.tween_callback(get_tree().reload_current_scene)
	pass
	
# function when the player collides with the landing pad
func complete_level(next_level_file: String) -> void:
	print("Level Complete!")
	success_particles.emitting = true
	booster_particles.emitting = false
	right_booster_particles.emitting = false
	left_booster_particles.emitting = false
	rocket_audio.stop()
	sucess_audio.play()
	set_process(false)
	is_transitioning = true
	var tween = create_tween()
	tween.tween_interval(2.0)
	tween.tween_callback(get_tree().change_scene_to_file.bind(next_level_file))
	pass

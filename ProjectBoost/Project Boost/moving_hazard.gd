extends AnimatableBody3D

## The position of the moving hazard
@export var destination : Vector3
## The duration of the movement
@export var duration : float = 1.0

func _ready() -> void:
	var tween = create_tween()
	tween.set_loops()
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "global_position", global_position + destination, duration)
	tween.tween_property(self, "global_position", global_position, duration)
	pass

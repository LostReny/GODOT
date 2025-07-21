extends Area3D

@export var gravity_force: Vector3 = Vector3.DOWN * 3.0

var bodies_in_field: Array = []

func _ready():
	connect("body_entered", _on_area_3d_body_entered)
	connect("body_exited", _on_area_3d_body_exited)

func _on_area_3d_body_entered(body):
	if body is RigidBody3D:
		bodies_in_field.append(body)
		#print("body_entered")

func _on_area_3d_body_exited(body):
	if body in bodies_in_field:
		bodies_in_field.erase(body)

func _physics_process(delta):
	for body in bodies_in_field:
		if body and body.is_inside_tree():
			body.apply_central_force(gravity_force)

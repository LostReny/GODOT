extends CharacterBody2D

const SPEED = 100.0


func _physics_process(delta):
	
	velocity.x = 0
	velocity.y = 0
	
	var dir = Input.get_axis("ui_up", "ui_down")
	if dir:
		velocity.y = dir * SPEED
	else: 
		velocity.y = move_toward(0,velocity.y, SPEED)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

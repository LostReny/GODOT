extends CharacterBody2D

const SPEED = 100.0

var input_direction : Vector2 = Vector2.ZERO
var is_moving : bool = false

@onready var sprite = $AnimatedSprite2D

func _physics_process(delta):
	_get_input_direction()
	velocity = input_direction * SPEED
	move_and_slide()
	_get_sprite()


func _get_input_direction():
	var x = -int(Input.is_action_pressed("LEFT")) + int(Input.is_action_pressed("RIGHT"))
	var y = -int(Input.is_action_pressed("UP")) + int(Input.is_action_pressed("DOWN"))
	
	input_direction = Vector2(x,y).normalized()
	is_moving = input_direction != Vector2.ZERO
	#return input_direction


func _get_sprite():
	if is_moving:
		if sprite.animation != "run":
			sprite.play("run")
	else:
		if sprite.animation != "idle":
			sprite.play("idle")
	pass

#fazer sprite mudar de lado, quando for pra esquerda
func _flip_sprite():
	pass

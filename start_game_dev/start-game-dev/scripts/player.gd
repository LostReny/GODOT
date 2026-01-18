extends CharacterBody2D

const SPEED = 100.0

var input_direction : get = _get_input_direction
var sprite_direction
var is_moving = false

@onready var sprite = $AnimatedSprite2D

func _physics_process(delta):
	velocity = input_direction * SPEED
	is_moving == true
	move_and_slide()


func _get_input_direction():
	var x = -int(Input.is_action_pressed("LEFT")) + int(Input.is_action_pressed("RIGHT"))
	var y = -int(Input.is_action_pressed("UP")) + int(Input.is_action_pressed("DOWN"))
	input_direction = Vector2(x,y).normalized()
	return input_direction

#fazer sprite de correr quando se mover 
#fazer sprite mudar de lado, quando for pra esquerda
func _get_sprite():
	if  is_moving == true:
		sprite = "run"
		pass

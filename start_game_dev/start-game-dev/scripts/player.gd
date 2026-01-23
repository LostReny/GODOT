extends CharacterBody2D

const SPEED = 80.0

var input_direction : Vector2 = Vector2.ZERO
var is_moving : bool = false
var is_rolling : bool = false

@onready var sprite = $AnimatedSprite2D

func _ready():
	sprite.animation_finished.connect(_on_animation_finished)


func _physics_process(delta):
	_get_input_direction()
	velocity = input_direction * SPEED
	move_and_slide()
	_update_animation()
	_flip_sprite()


func _get_input_direction():
	var x = -int(Input.is_action_pressed("LEFT")) + int(Input.is_action_pressed("RIGHT"))
	var y = -int(Input.is_action_pressed("UP")) + int(Input.is_action_pressed("DOWN"))
	
	input_direction = Vector2(x,y).normalized()
	is_moving = input_direction != Vector2.ZERO
	
	if Input.is_action_pressed("ROLL"):
		is_rolling = true
	else:
		is_rolling = false


func _update_animation():
	# prioridade: ROLL > RUN > IDLE
	if is_rolling and is_moving:
		if sprite.animation != "roll":
			sprite.play("roll")
	elif is_moving:
		if sprite.animation != "run":
			sprite.play("run")
	else:
		if sprite.animation != "idle":
			sprite.play("idle")

#fazer sprite mudar de lado, quando for pra esquerda
func _flip_sprite():
	if input_direction.x < 0:
		sprite.flip_h = true
	elif input_direction.x > 0:
		sprite.flip_h = false
	pass
	
func _on_animation_finished():
	if sprite.animation == "roll":
		is_rolling = true

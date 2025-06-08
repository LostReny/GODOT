extends Area2D

var click_counter : int = 0

## value to reach the upgrade point
@export var upgrade_value : int

#função de ler quando clica
func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		_click_counter()
	pass

#somando a quantidade de clique
func _click_counter() -> void:
	click_counter = click_counter + 1
	print(click_counter)
	_upgrade()
	pass

#upgrade funcition
func _upgrade() -> void:
	if click_counter == upgrade_value:
		print("upgrade")
	pass

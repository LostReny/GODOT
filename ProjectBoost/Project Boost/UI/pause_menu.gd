extends Control

@export_file("*.tscn") var menu_path : String

@onready var pause_button: Button = $PauseButton
@onready var back_game_button: Button = $BackGameButton
@onready var panel = $Panel

@onready var player = get_node("/root/Level/Player")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause_menu"):
		pause_button.visible = true
		back_game_button.visible = true
		panel.visible = true
		player.is_paused = true


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(menu_path)


func _on_back_game_button_pressed() -> void:
	get_tree().reload_current_scene()


#sistema de levels ?
#fazer botão e salvar o progresso do jogo
#escolher entre os níves, e começar pelo nível que está

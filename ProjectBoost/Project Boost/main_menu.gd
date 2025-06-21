extends Control

@export_file("*.tscn") var start_path : String

func _on_start_button_pressed():
	get_tree().change_scene_to_file(start_path)


func _on_htp_button_pressed():
	# painel com intruções de como jogar
	pass # Replace with function body.


func _on_exit_button_pressed():
	get_tree().quit()

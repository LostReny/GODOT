extends Control

@export_file("*.tscn") var menu_path : String

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(menu_path)

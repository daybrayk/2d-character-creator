extends Node2D

@export var character_data: CharacterData
@export var main_scene: PackedScene


func _on_line_edit_text_changed(new_text):
	character_data.player_name = new_text


func _on_confirm_button_pressed():
	SceneManager.change_scene_from_packed(main_scene)

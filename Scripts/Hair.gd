extends Node2D

@onready var hair_sprite: Sprite2D = $Sprite2D

var hair_keys = []
var color_keys = []
var current_hair_index: int = 0
var current_color_index: int = 0

@export var character_options: CharacterOptions
@export var character_data: CharacterData


func _ready():
	set_sprite_keys()
	current_hair_index = hair_keys.find("none")
	update_sprite()


func set_sprite_keys():
	hair_keys = character_options.hair_collection.keys()


func update_sprite():
	var key = hair_keys[current_hair_index]
	print_debug(key)
	if key == "none":
		hair_sprite.texture = null
	else:
		hair_sprite.texture = character_options.hair_collection[key]
		hair_sprite.modulate = character_options.hair_color_options[current_color_index]
	
	character_data.set_hair(key, hair_sprite.texture)
	character_data.selected_hair_color = character_options.hair_color_options[current_color_index]


func _on_collection_button_pressed():
	current_hair_index = (current_hair_index + 1) % character_options.hair_collection.size()
	update_sprite()


func _on_color_button_pressed():
	current_color_index = (current_color_index + 1) % character_options.color_options.size()
	update_sprite()

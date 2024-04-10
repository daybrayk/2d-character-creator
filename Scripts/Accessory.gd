extends Node2D

@onready var accessory_sprite: Sprite2D = $Sprite2D

var accessory_keys = []
var color_keys = []
var current_key_index: int = 0
var current_color_index: int = 0

@export var character_options: CharacterOptions
@export var character_data: CharacterData


func _ready():
	set_sprite_keys()
	current_key_index = accessory_keys.find("none")
	update_sprite()

func set_sprite_keys():
	accessory_keys = character_options.hat_collection.keys()

func update_sprite():
	var key = accessory_keys[current_key_index]
	if key == "none":
		accessory_sprite.texture = null
	else:
		accessory_sprite.texture = character_options.hat_collection[key]
		accessory_sprite.modulate = character_options.color_options[current_color_index]
	
	
	character_data.set_accessory(key, accessory_sprite.texture)
	character_data.selected_accessory_color = character_options.color_options[current_color_index]


func _on_collection_button_pressed():
	current_key_index = (current_key_index + 1) % accessory_keys.size()
	update_sprite()


func _on_color_button_pressed():
	current_color_index = (current_color_index + 1) % character_options.color_options.size()
	update_sprite()

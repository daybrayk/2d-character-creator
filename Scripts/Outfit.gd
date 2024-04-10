extends Node2D

@onready var outfit_sprite: Sprite2D = $Sprite2D

var outfit_keys = []
var color_keys = []
var current_outfit_index: int = 0
var current_color_index: int = 0

@export var character_options: CharacterOptions
@export var character_data: CharacterData


func _ready():
	set_sprite_keys()
	update_sprite()


func set_sprite_keys():
	outfit_keys = character_options.outfit_collection.keys()


func update_sprite():
	var key = outfit_keys[current_outfit_index]
	outfit_sprite.texture = character_options.outfit_collection[key]
	outfit_sprite.modulate = character_options.color_options[current_color_index]
	
	character_data.set_outfit(key, outfit_sprite.texture)
	character_data.selected_outfit_color = character_options.color_options[current_color_index]


func _on_collection_button_pressed():
	current_outfit_index = (current_outfit_index + 1) % character_options.outfit_collection.size()
	update_sprite()


func _on_color_button_pressed():
	current_color_index = (current_color_index + 1) % character_options.color_options.size()
	update_sprite()

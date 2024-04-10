extends Node2D

@onready var body_sprite: Sprite2D = $Sprite2D

var body_keys = []
var color_keys = []
var current_body_index: int = 0
var current_color_index: int = 0

@export var character_options: CharacterOptions
@export var character_data: CharacterData


func _ready():
	set_sprite_keys()
	update_sprite()


func set_sprite_keys():
	body_keys = character_options.body_collection.keys()


func update_sprite():
	var key = body_keys[current_body_index]
	body_sprite.texture = character_options.body_collection[key]
	body_sprite.modulate = character_options.body_color_options[current_color_index]
	
	character_data.set_body(key, body_sprite.texture)
	character_data.selected_body_color = character_options.body_color_options[current_color_index]


func _on_collection_button_pressed():
	current_body_index = (current_body_index + 1) % character_options.body_collection.size()
	update_sprite()


func _on_color_button_pressed():
	current_color_index = (current_color_index + 1) % character_options.color_options.size()
	update_sprite()

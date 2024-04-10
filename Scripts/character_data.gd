class_name CharacterData extends Resource


var player_name = ""

var _body_key: String
var _body_texture: Texture

var _hair_key: String
var _hair_texture: Texture

var _outfit_key: String
var _outfit_texture: Texture

var _accessory_key: String
var _accessory_texture: Texture

var selected_body_color = Color(1, 1, 1)
var selected_hair_color = Color(1, 1, 1)
var selected_outfit_color = Color(1, 1, 1)
var selected_accessory_color = Color(1, 1, 1)


func set_body(key: String, texture: Texture):
	_body_key = key
	_body_texture = texture


func set_hair(key: String, texture: Texture):
	_hair_key = key
	_hair_texture = texture


func set_outfit(key: String, texture: Texture):
	_outfit_key = key
	_outfit_texture = texture


func set_accessory(key: String, texture: Texture):
	_accessory_key = key
	_accessory_texture = texture

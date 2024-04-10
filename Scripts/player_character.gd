extends CharacterBody2D

const SPEED = 200
const DECELERATION = 800
var last_direction = Vector2.ZERO

@onready var _animator: AnimationPlayer = $AnimationPlayer

@export var character_options: CharacterOptions
@export var character_data: CharacterData
@export var body: Sprite2D
@export var hair: Sprite2D
@export var outfit: Sprite2D
@export var accessory: Sprite2D
@export var player_name: Label


func _ready():
	update_visrep()
	_animator.play("Idle_Down")
	player_name.text = character_data.player_name


func _physics_process(delta):
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	
	#store last direction
	if direction != Vector2.ZERO and direction != last_direction:
		last_direction = direction


	#update direction and velocity
	if direction.x != 0:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, DECELERATION * delta)
	
	if direction.y != 0:
		velocity.y = direction.y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, DECELERATION * delta)


	var animation_to_play:String = ""
	if direction == Vector2.ZERO:
		if last_direction.x > 0:
			animation_to_play = "Idle_Right"
		elif last_direction.x < 0:
			animation_to_play = "Idle_Left"
		elif last_direction.y > 0:
			animation_to_play = "Idle_Down"
		elif last_direction.y < 0:
			animation_to_play = "Idle_Up"
	elif direction.x > 0:
		animation_to_play = "Walk_Right"
	elif direction.x < 0:
		animation_to_play = "Walk_Left"
	elif direction.y > 0:
		animation_to_play = "Walk_Down"
	elif direction.y < 0:
		animation_to_play = "Walk_Up"
	
	_animator.play(animation_to_play)
	move_and_slide()


func update_visrep():
	body.texture = character_data._body_texture
	body.modulate = character_data.selected_body_color
	
	hair.texture = character_data._hair_texture
	hair.modulate = character_data.selected_hair_color
	
	outfit.texture = character_data._outfit_texture
	outfit.modulate = character_data.selected_outfit_color
	
	accessory.texture = character_data._accessory_texture
	accessory.modulate = character_data.selected_accessory_color

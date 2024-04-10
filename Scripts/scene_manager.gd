extends Node


var current_scene: Node = null


func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	print_debug(current_scene)


func add_scene_from_path(scene_path: String):
	call_deferred("_deferred_add_scene_from_path", scene_path)


func _deferred_add_scene_from_path(res_path: String):
	var s = load(res_path)
	var scene = s.instantiate()
	current_scene.add_child(scene)
	

func load_scene_from_packed(scene: PackedScene):
	call_deferred("_deferred_add_scene_from_packed", scene)


func _deferred_add_scene_from_packed(res: PackedScene):
	var scene = res.instantiate()
	current_scene.add_child(scene)

func change_scene_from_path(scene_path: String):
	call_deferred("_deferred_change_scene_from_path", scene_path)


func _deferred_change_scene_from_path(res_path: String):
	current_scene.free()
	var s = load(res_path)
	current_scene = s.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene


func change_scene_from_packed(scene: PackedScene):
	call_deferred("_deferred_change_scene_from_packed", scene)


func _deferred_change_scene_from_packed(res: PackedScene):
	current_scene.free()
	current_scene = res.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene

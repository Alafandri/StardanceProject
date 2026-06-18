extends Button

@export_file("*.tscn") var target_scene: String = "res://Scenes/main.tscn"

func _ready() -> void:
	pass

func _on_pressed() -> void:
	if target_scene != "":
		get_tree().change_scene_to_file(target_scene)

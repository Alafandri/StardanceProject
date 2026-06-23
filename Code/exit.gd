extends Button

func _on_pressed() -> void:
	$"..".visible = false
	$"../../CanvasLayer/Label2".visible = true

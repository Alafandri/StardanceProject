extends Button

func _ready() -> void:
	$".".visible = true
	$"../Startup".visible = false

func _on_pressed() -> void:
	$".".visible = false
	$"../Startup".visible = true

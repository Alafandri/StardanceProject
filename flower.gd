extends Sprite2D

var tween: Tween
var tween2: Tween

var lives: int = 3
var current_request: String = ""

func _process(_delta: float) -> void:
	$"../Lives".text = "Lives: " + str(lives)
	
	if lives <= 0:
		print("game over")
		
		for stuff in $"..".get_children():
			if stuff.name != "Game over":
				stuff.visible = false
				
		$"../Game over".visible = true
		set_process(false)

func _ready() -> void:
	random_text()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if tween and tween.is_running():
		tween.kill()
		
	tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.8, 0.8), 0.05)
	
	var parent = area.get_parent()
	if parent and parent.has_signal("_signal"):
		if not parent._signal.is_connected(_on_scissors_triggered):
			parent._signal.connect(_on_scissors_triggered)

func _on_area_2d_area_exited(area: Area2D) -> void:
	if tween2 and tween2.is_running():
		tween2.kill()

	tween2 = create_tween()
	tween2.tween_property(self, "scale", Vector2(0.69, 0.69), 0.05)
	
	var parent = area.get_parent()
	if parent and parent.has_signal("_signal"):
		if parent._signal.is_connected(_on_scissors_triggered):
			parent._signal.disconnect(_on_scissors_triggered)

func _on_scissors_triggered(tool_name: String) -> void:
	print("Used tool: ", tool_name)
	
	if tool_name == current_request:
		print("Correct!")
		random_text()
	else:
		print("Wrong!")
		lives -= 1

func random_text() -> void:
	var random_pick = randi_range(1, 3)
	
	if random_pick == 1:
		$"../Label".text = "I want scissors"
		current_request = "Scissors"
	elif random_pick == 2:
		$"../Label".text = "I want water"
		current_request = "Water"
	elif random_pick == 3:
		$"../Label".text = "I want soil"
		current_request = "Soil"

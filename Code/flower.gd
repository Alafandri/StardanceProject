extends Sprite2D

var tween: Tween
var tween2: Tween

var lives: int = 3
var current_request: String = ""

var score = 0
var goal = 1000 #original is 10000

var time: float = 5.0

func _process(_delta: float) -> void:
	$"../Lives".text = "Lives: " + str(lives)
	
	$"../Score".text = str(score)
	
	if $"../Timer/Timer".time_left > 0:
		$"../Timer".text = "Time: " + str(snapped($"../Timer/Timer".time_left, 1))
		
	if score >= goal:
		$"../Victory".visible = true
		for stuff in $"..".get_children():
			if stuff.name != "Victory":
				stuff.visible = false
		

func _ready() -> void:
	$"../Timer/Timer".timeout.connect(_on_timer_timeout)
	random_text()

func trigger_game_over() -> void:
	for stuff in $"..".get_children():
		if stuff.name != "Game over":
			stuff.visible = false
			
	$"../Game over".visible = true
	set_process(false)

func _on_timer_timeout() -> void:
	trigger_game_over()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if tween and tween.is_running():
		tween.kill()
		
	tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.8, 0.8), 0.05)
	
	var parent = area.get_parent()
	if parent and parent.has_signal("_signal"):
		if not parent._signal.is_connected(_on_triggered):
			parent._signal.connect(_on_triggered)
			$"../Click".play()


func _on_area_2d_area_exited(area: Area2D) -> void:
	if tween2 and tween2.is_running():
		tween2.kill()

	tween2 = create_tween()
	tween2.tween_property(self, "scale", Vector2(0.69, 0.69), 0.05)
	
	var parent = area.get_parent()
	if parent and parent.has_signal("_signal"):
		if parent._signal.is_connected(_on_triggered):
			parent._signal.disconnect(_on_triggered)

func _on_triggered(tool_name: String) -> void:
	if tool_name == current_request:
		var new_time = $"../Timer/Timer".wait_time - 0.5
		$"../Timer/Timer".wait_time = max(5.0, new_time)
		$"../Timer/Timer".start()
		random_text()
		score += 100
		$"../Correct".play()
	else:
		lives -= 1
		$"../Wrong".play()
		if lives <= 0:
			trigger_game_over()

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

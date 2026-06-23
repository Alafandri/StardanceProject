extends Button

var last_press_time := 0.0

func _on_pressed():
	var current_time = Time.get_ticks_msec() / 1000.0

	if current_time - last_press_time <= 0.3:
		$"../Loading".visible = true

		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://Scenes/main.tscn")

	last_press_time = current_time

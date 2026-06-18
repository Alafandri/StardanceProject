extends Sprite2D

var dragging = false
var of = Vector2(0,0)
var start_position: Vector2
var end_position: Vector2

var tween: Tween
var tween2: Tween

signal _signal(tool_name: String)

func _ready() -> void:
	start_position = global_position


func _process(_delta):
	if dragging:
		position = get_global_mouse_position() - of


func _on_button_button_down() -> void:
	dragging = true
	
	z_index = 4

	tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.25, 1.25), 0.05)

	tween2 = create_tween()
	tween2.set_loops()
	tween2.tween_property(self, "rotation_degrees", 5.0, 0.25)
	tween2.tween_property(self, "rotation_degrees", -5.0, 0.4)
	tween2.tween_property(self, "rotation_degrees", 0.0, 0.25)

	of = get_global_mouse_position() - global_position

func _on_button_button_up() -> void:
	dragging = false

	if tween2:
		tween2.kill()

	rotation_degrees = 0

	var tween3 = create_tween()
	tween3.tween_property(self, "scale", Vector2(1, 1), 0)
	
	z_index = 0

	end_position = global_position
	print(end_position)
	position = start_position
	_signal.emit(name)
	$"../Dirt".play()

func _on_button_mouse_entered() -> void:
	var tween4 = create_tween()
	tween4.tween_property(self, "scale", Vector2(1.1, 1.1), 0.1)
	$CPUParticles2D.visible = true
	$"../Click".play()


func _on_button_mouse_exited() -> void:
	var tween5 = create_tween()
	tween5.tween_property(self, "scale", Vector2(1, 1), 0.1)
	$CPUParticles2D.visible = false

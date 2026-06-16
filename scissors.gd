extends Sprite2D

var dragging = false
var of = Vector2(0,0)
var start_position: Vector2
var end_position: Vector2

func _ready() -> void:
	start_position = global_position


func _process(_delta):
	if dragging:
		position = get_global_mouse_position() - of


func _on_button_button_down() -> void:
	dragging = true
	of = get_global_mouse_position() - global_position

func _on_button_button_up() -> void:
	dragging = false
	end_position = global_position
	print(end_position)
	position = start_position

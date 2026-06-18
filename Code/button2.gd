extends Node

func _on_pressed() -> void:
	$"../..".visible = false
	$"../../../Scissors".visible = true
	$"../../../Soil".visible = true
	$"../../../Water".visible = true

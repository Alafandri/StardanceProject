extends Button


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass
	



func _on_pressed() -> void:
	if $"../LineEdit".text == "":
		$"../Label".text = "Enter name first!"
		$"../LineEdit".text = ""
	elif $"../LineEdit".text == " ":
		$"../Label".text = "Enter name first!"
		$"../LineEdit".text = ""
	elif $"../LineEdit".text == "  ":
		$"../Label".text = "Enter name first!"
		$"../LineEdit".text = ""
	elif $"../LineEdit".text == "   ":
		$"../Label".text = "Enter name first!"
		$"../LineEdit".text = ""
	elif $"../LineEdit".text == "    ":
		$"../Label".text = "Enter name first!"
		$"../LineEdit".text = ""
	elif $"../LineEdit".text == "     ":
		$"../Label".text = "Enter name first!"
		$"../LineEdit".text = ""
	elif $"../LineEdit".text == "      ":
		$"../Label".text = "Enter name first!"
		$"../LineEdit".text = ""
	elif $"../LineEdit".text == "       ":
		$"../Label".text = "Enter name first!"
		$"../LineEdit".text = ""
	elif $"../LineEdit".text == "        ":
		$"../Label".text = "Enter name first!"
		$"../LineEdit".text = ""
	elif $"../LineEdit".text == "         ":
		$"../Label".text = "Enter name first!"
		$"../LineEdit".text = ""
	elif $"../LineEdit".text == "          ":
		$"../Label".text = "Enter name first!"
		$"../LineEdit".text = ""
		
	else:
		$"../Label".text = "Hello, " + $"../LineEdit".text + "!"
		$"../LineEdit".visible = false
		$".".visible = false
		$"../Button2".visible = true
		
# to whoever is reading this ik this is peak coding! Undertale and yandere sim coding be like. Don't judge me

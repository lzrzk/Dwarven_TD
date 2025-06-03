extends Node2D
var dialogueDwarf1 = "Dwarf: Who... are you."
var dialogueDark1 = "Dark: Your demise."
var dialogueDwarf2 = "Dwarf: I... could've expected this."
var dialogueDark2 = "Dark: Run while you can."
var dialogueDwarf3 = "Dwarf: I... I better meet my end here for there is no place where I can run. The rats, the gollems and your folk are blocking every exit from these caverns."
var dialogueDark3 = "Dark: Yet another fool meets his end."
var dialogueScript = [dialogueDwarf1,dialogueDark1,dialogueDwarf2,dialogueDark2,dialogueDwarf3,dialogueDark3]
var actualDialogueNumber = 0

func _ready() -> void:
	var dialogueDwarf1 = "Dwarf: Who... are you."
	var dialogueDark1 = "Dark: Your demise."
	var dialogueDwarf2 = "Dwarf: I... could've expected this."
	var dialogueDark2 = "Dark: Run while you can."
	var dialogueDwarf3 = "Dwarf: I... I better meet my end here for there is no place where I can run. The rats, the gollems and your folk are blocking every exit from these caverns."
	var dialogueDark3 = "Dark: Yet another fool meets his end."
	var dialogueScript = [dialogueDwarf1,dialogueDark1,dialogueDwarf2,dialogueDark2,dialogueDwarf3,dialogueDark3]

func _process(delta: float) -> void:  
	if Input.is_action_just_pressed("ui_accept"):
		if actualDialogueNumber == 6:
			actualDialogueNumber = 0
			$StartButtonButton.visible = true
		$RichTextLabel.text = dialogueScript[actualDialogueNumber]
		actualDialogueNumber += 1
		
	


func _on_start_button_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/Mainmenu.tscn")

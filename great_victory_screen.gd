extends Node2D
var dialogueDwarf1 = "Dwarf: You look like the black creatures that attacked me."
var dialogueDark1 = "Dark: For I'm them."
var dialogueDwarf2 = "Dwarf: Oh... So you will join them in their afterlife."
var dialogueDark2 = "Dark: How does someone as week as you dare to threaten ME."
var dialogueDwarf3 = "Dwarf: This is mine kingdom, mine reign, mine tunels. You have no power here. If you want to prove otherwise prove it and challenge me."
var dialogueDark3 = "Dark: I... I have to... surender."
var dialogueScript = [dialogueDwarf1,dialogueDark1,dialogueDwarf2,dialogueDark2,dialogueDwarf3,dialogueDark3]
var actualDialogueNumber = 0

func _ready() -> void:
	var dialogueDwarf1 = "Dwarf: You look like the black creatures that attacked me."
	var dialogueDark1 = "Dark: For I'm them."
	var dialogueDwarf2 = "Dwarf: Oh... So you will join them in their afterlife."
	var dialogueDark2 = "Dark: How does someone as week as you dare to threaten ME."
	var dialogueDwarf3 = "Dwarf: This is mine kingdom, mine reign, mine tunels. You have no power here. If you want to prove otherwise prove it and challenge me."
	var dialogueDark3 = "Dark: I... I have to... surender."
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

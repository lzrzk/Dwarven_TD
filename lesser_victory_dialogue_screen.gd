extends Node2D
var dialogueDwarf1 = "Dwarf: You look like the black creatures that attacked me."
var dialogueDark1 = "Dark: For I'm them."
var dialogueDwarf2 = "Dwarf: Be gone then foul creature. For this is mine kingdom and I'll reign till the end of time."
var dialogueDark2 = "Dark: Stop me... If you want to keep your life"
var dialogueDwarf3 = "Dwarf: I... I think... I'll leave"
var dialogueDark3 = "Dark: What I thought."
var dialogueScript = [dialogueDwarf1,dialogueDark1,dialogueDwarf2,dialogueDark2,dialogueDwarf3,dialogueDark3]
var actualDialogueNumber = 0

func _ready() -> void:
	var dialogueDwarf1 = "Dwarf: You look like the black creatures that attacked me."
	var dialogueDark1 = "Dark: For I'm them."
	var dialogueDwarf2 = "Dwarf: Be gone then foul creature. For this is mine kingdom and I'll reign till the end of time."
	var dialogueDark2 = "Dark: Stop me... If you want to keep your life"
	var dialogueDwarf3 = "Dwarf: I... I think... I'll leave"
	var dialogueDark3 = "Dark: What I thought."
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

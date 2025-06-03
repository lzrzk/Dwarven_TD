extends Node2D
var dialogueDwarf1 = "Dwarf: Well, hello there. Why are you here and what are you?"
var dialogueRat1 = "Rat: I'm king of this land and I supose your bipedal self could've understood that by my crown. By the way aren't you too short for a bipedal?"
var dialogueDwarf2 = "Dwarf: That crown is mine and this is my domain. I just left for a quick nap and maybe a few beers. If I think about it a bit more I supose I overslept."
var dialogueRat2 = "Rat: Finders keepers. So now I'm in rule here and you better leave with your two legs. Again I'll ask about your shortness?"
var dialogueDwarf3 = "Dwarf: Once more you mention my stature and you'll go on a grill. Also give me back my crown or I'll employ the survival of the fitest."
var dialogueRat3 = "Rat: GUARDS! HELP YOUR RATNESS WITH THAT SHORT BRUTE!!!"
var dialogueScript = [dialogueDwarf1,dialogueRat1,dialogueDwarf2,dialogueRat2,dialogueDwarf3,dialogueRat3]
var actualDialogueNumber = 0

func _ready() -> void:
	var dialogueDwarf1 = "Dwarf: Well, hello there. Why are you here and what are you?"
	var dialogueRat1 = "Rat: I'm king of this land and I supose your bipedal self could've understood that by my crown. By the way aren't you too short for a bipedal?"
	var dialogueDwarf2 = "Dwarf: That crown is mine and this is my domain. I just left for a quick nap and maybe a few beers. If I think about it a bit more I supose I overslept."
	var dialogueRat2 = "Rat: Finders keepers. So now I'm in rule here and you better leave with your two legs. Again I'll ask about your shortness?"
	var dialogueDwarf3 = "Dwarf: Once more you mention my stature and you'll go on a grill. Also give me back my crown or I'll employ the survival of the fitest."
	var dialogueRat3 = "Rat: GUARDS! HELP YOUR RATNESS WITH THAT SHORT BRUTE!!!"
	var dialogueScript = [dialogueDwarf1,dialogueRat1,dialogueDwarf2,dialogueRat2,dialogueDwarf3,dialogueRat3]


func _process(delta: float) -> void:  
	if Input.is_action_just_pressed("ui_accept"):
		if actualDialogueNumber == 6:
			actualDialogueNumber = 0
			$StartButtonButton.visible = true
		$RichTextLabel.text = dialogueScript[actualDialogueNumber]
		actualDialogueNumber += 1
		
	


func _on_start_button_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level/Level.tscn")

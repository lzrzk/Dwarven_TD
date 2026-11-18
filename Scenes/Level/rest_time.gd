extends Node
#region base stats
var action_count = 2
var ore_given = 10
signal windowOreChange
var permanent_action_count = 2
#endregion

#region megatowers
var mega_crystal = load("res://Scenes/Towers/mega_crystal.tscn") as PackedScene
var mega_ballista  = load("res://Scenes/Towers/mega_ballista.tscn") as PackedScene
var crystal_bought = false
var ballista_bought = false
#endregion

#region links to buttons and labels
@export var oreButton:Button
@export var ActionCountLabel:Label
#endregion

func check_if_rest_time_over():
	if action_count <= 0:
		Variables.is_rest_time_over = true
	ActionCountLabel.text = "action_count:"  + str(action_count) + "/" + str(permanent_action_count)

func _on_ore_button_pressed() -> void:
	Variables.ore += ore_given
	action_count -= 1
	windowOreChange.emit()
	oreButton.text = "dig " + str(ore_given)
	check_if_rest_time_over()

func _ready() -> void:
	oreButton.text = "dig " + str(ore_given)
	check_if_rest_time_over()



func _on_dig_upgrade_button_pressed() -> void:
	if Variables.ore >= 25:
		ore_given += 10
		Variables.ore -= 25
		action_count -= 1
		windowOreChange.emit()
		oreButton.text = "dig " + str(ore_given)
		check_if_rest_time_over()


func _on_visibility_changed() -> void:
	action_count = permanent_action_count


func _on_mega_crystal_button_pressed() -> void:
	if Variables.ore >= 750:
		Variables.ore -= 750
		action_count -= 1
		crystal_bought = true
		$"../towers/Mega_crystal".visible = true
		$"../towers/Mega_crystal".can_atack = true
		Variables.victoryPoints += 1
		windowOreChange.emit()
		$megaCrystalButton.visible = false
	check_if_rest_time_over()



func _on_mega_ballista_button_pressed() -> void:
	if Variables.ore >= 750:
		Variables.ore -= 750
		action_count -= 1
		ballista_bought = true
		$"../towers/Mega_ballista".visible = true
		$"../towers/Mega_ballista".can_atack = true
		Variables.victoryPoints += 1
		windowOreChange.emit()
		$megaBallistaButton.visible = false
	check_if_rest_time_over()

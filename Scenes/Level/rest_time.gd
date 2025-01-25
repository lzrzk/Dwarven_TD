extends Node
var action_count = 2
var ore_given = 10
func _on_ore_button_pressed() -> void:
	Variables.ore += ore_given
	action_count -= 1
func _process(delta: float) -> void:
	$oreButton.text = "dig " + str(ore_given)
	if action_count <= 0:
		Variables.next_wave = true


func _on_dig_upgrade_button_pressed() -> void:
	if Variables.ore >= 25:
		ore_given += 10
		Variables.ore -= 25
		action_count -= 1


func _on_visibility_changed() -> void:
	action_count = 2


func _on_mega_crystal_button_pressed() -> void:
	if Variables.ore >= 750:
		Variables.ore -= 750
		action_count -= 1
		$"../towers/Mega_crystal".visibility = true

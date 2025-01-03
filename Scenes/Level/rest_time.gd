extends Node
var action_count = 2
var ore_given = 5
func _on_ore_button_pressed() -> void:
	Variables.ore += ore_given
	action_count -= 1
func _process(delta: float) -> void:
	$oreButton.text = "dig" + str(ore_given)
	if action_count <= 0:
		get_tree().change_scene_to_file("res://Scenes/Level/Level.tscn")
		Variables.next_wave = true


func _on_dig_upgrade_button_pressed() -> void:
	ore_given += 10
	Variables.ore -= 5
	action_count -= 1

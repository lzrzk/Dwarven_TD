extends Node
var action_count = 2
var ore_given = 10
var mega_crystal = load("res://Scenes/Towers/mega_crystal.tscn") as PackedScene
var mega_ballista  = load("res://Scenes/Towers/mega_ballista.tscn") as PackedScene
var crystal_bought = false
var permanent_action_count
func _on_ore_button_pressed() -> void:
	Variables.ore += ore_given
	action_count -= 1
func _process(delta: float) -> void:
	$oreButton.text = "dig " + str(ore_given)
	if crystal_bought == true:
		$megaCrystalButton.visibility = false
	if action_count <= 0:
		Variables.next_wave = true


func _on_dig_upgrade_button_pressed() -> void:
	if Variables.ore >= 25:
		ore_given += 10
		Variables.ore -= 25
		action_count -= 1


func _on_visibility_changed() -> void:
	action_count = permanent_action_count


func _on_mega_crystal_button_pressed() -> void:
	if Variables.ore >= 750:
		Variables.ore -= 750
		action_count -= 1
		crystal_bought = true 
		var meg_crys=mega_crystal.instantiate()
		# meg_crys.global_position
		%towers.add_child(meg_crys.instantiate)
		

func _on_mega_ballista_button_pressed() -> void:
	if Variables.ore >= 750:
		Variables.ore -= 750
		action_count -= 1
		crystal_bought = true 
		var meg_ball=mega_ballista.instantiate()
		# meg_ball.global_position
		%towers.add_child(meg_ball.instantiate)

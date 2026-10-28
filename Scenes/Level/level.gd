extends Node2D

var endwave:bool = false

@export var mob_spawner:MobSpawner

func _ready() -> void:
	Variables.enemyPath = $EnemyPath
	Variables.enemies = $enemies
	mob_spawner.startWave()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$OreLabel.text = "Ore:" + str(Variables.ore)
	$LivesLabel.text = "Lives" + str(Variables.lives)
	if Variables.lives <= 0:
		get_tree().change_scene_to_file("res://Scenes/Level/defeat_screen.tscn")
	$WaveLabel.text = "Wave: " + str(Variables.waveNumber)
	
	if !mob_spawner.waves.is_is_rest_time_over_exist():
		if Variables.victoryPoints == 2 and Variables.lives > 10:
			get_tree().change_scene_to_file("res://Scenes/Level/great_victory_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/Level/lesser_victory_screen.tscn")
	
	if len($enemies.get_children()) == 0 and endwave:
		$Window.visible = true
		if Variables.is_rest_time_over:
			mob_spawner.startWave()
			endwave = false
			$Window.visible = false
			Variables.is_rest_time_over = false


func _on_mob_spawner_endwave() -> void:
	endwave = true


func _on_crystal_button_pressed() -> void:
	pass # Replace with function body.

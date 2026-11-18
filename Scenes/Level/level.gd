extends Node2D

var ratSceen = load("res://Scenes/Enemy/Rat.tscn") as PackedScene
var endwave = false

@export var mobSpawner:MobSpawner
@export_group("Lables")
@export var oreLabel : Label
@export var livesLabel : Label
@export var waveLabel :  Label


func _ready() -> void:
	Variables.enemyPath = $EnemyPath
	Variables.enemies = $enemies
	mobSpawner.startWave()

func _process(delta: float) -> void:
	#region Game Over
	if Variables.lives <= 0:
		get_tree().change_scene_to_file("res://Scenes/Level/defeat_screen.tscn")
	
	#endregion
	#region End Wave
	if len($enemies.get_children()) == 0 and endwave:
		# Victory
		if !mobSpawner.waves.is_next_wave_possible():
			if Variables.victoryPoints == 2 and Variables.lives > 10:
				get_tree().change_scene_to_file("res://Scenes/Level/great_victory_screen.tscn")
			else:
				get_tree().change_scene_to_file("res://Scenes/Level/lesser_victory_screen.tscn")
		# Rest time
		$Window.visible = true
		if Variables.is_rest_time_over:
			mobSpawner.startWave()
			endwave = false
			$Window.visible = false
			Variables.is_rest_time_over = false
	#endregion


func _on_mob_spawner_endwave() -> void:
	endwave = true
#region UI updates
func on_lives_lost() -> void:
	livesLabel.text = "Lives" + str(Variables.lives)

func on_ore_change() -> void:
	oreLabel.text = "Ore:" + str(Variables.ore)

func on_wave_change() -> void:
	waveLabel.text = "Wave: " + str(Variables.waveNumber)
#endregion


func _on_enemies_enemy_dead() -> void:
	on_ore_change()

func _on_window_window_ore_change() -> void:
	on_ore_change()

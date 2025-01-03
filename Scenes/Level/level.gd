extends Node2D

var ratSceen = load("res://Scenes/Enemy/Rat.tscn") as PackedScene
var endwave = false
func _ready() -> void:
	Variables.enemyPath = $EnemyPath
	Variables.enemies = $enemies
	$MobSpawner.startWave()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$OreLabel.text = "Ore:" + str(Variables.ore)
	$LivesLabel.text = "Lives" + str(Variables.lives)
	if Variables.lives <= 0:
		get_tree().change_scene_to_file("res://Scenes/Menu/Mainmenu.tscn")
	$WaveLabel.text = "Wave: " + str(Variables.waveNumber)
	
	if len($enemies.get_children()) == 0 and endwave:
		get_tree().change_scene_to_file("res://Scenes/Level/rest_time.tscn")
		if Variables.next_wave:
			$MobSpawner.startWave()
			endwave = false


func _on_mob_spawner_endwave() -> void:
	endwave = true

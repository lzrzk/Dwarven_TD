extends Node2D

var ratSceen = load("res://Scenes/Enemy/Rat.tscn") as PackedScene
# Called when the node enters the scene tree for the first time.
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
	
	
	if len($enemies.get_children()) == 0:
		$MobSpawner.startWave()

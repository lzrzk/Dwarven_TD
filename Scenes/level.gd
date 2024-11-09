extends Node2D

var ratSceen = load("res://Scenes/Enemy/Rat.tscn") as PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Variables.enemyPath = $EnemyPath
	
	var rat = ratSceen.instantiate()
	$enemies.add_child(rat)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

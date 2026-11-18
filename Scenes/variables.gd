extends Node

var enemyPath: Path2D
var ore: int = 200
var enemies:Node
var is_rest_time_over:bool
var waveNumber = 0
var selectedNode:Node
var victoryPoints = 0

signal lives_changed
var lives := 20:
	set(value):
		lives = value
		lives_changed.emit()
	get:
		return lives

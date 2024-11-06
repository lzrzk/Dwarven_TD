extends Node2D

var ratSceen = load("res://Scenes/Enemy/Rat.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rat = ratSceen()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

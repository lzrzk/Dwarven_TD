extends Node2D

var crystal_scene = preload("res://Scenes/Towers/Crystal.tscn")
var ballista_scene = preload("res://Scenes/Towers/ballista.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_actived_button_pressed() -> void:
	$ActivedButton.visible= false
	$CrystalButton.visible= true
	$BallistaButton.visible = true
	$StatueButton.visible = true
	$BackButton.visible = true
	
func _on_crystal_button_pressed() -> void:
	var crystal=crystal_scene.instantiate()
	crystal.position = self.position
	if ore < 100:
		pass
	else:
		%towers.add_child(crystal)
		ore-=100
		queue_free()

func _on_ballista_button_pressed() -> void:
	var ballista=ballista_scene.instantiate()
	ballista.position = self.position
	if ore < 100:
		pass
	else:
		%towers.add_child(ballista)
		ore-=100
		queue_free()


func _on_statue_button_pressed() -> void:
	pass


func _on_back_button_pressed() -> void:
	$ActivedButton.visible= true
	$CrystalButton.visible= false
	$BallistaButton.visible = false
	$StatueButton.visible = false
	$BackButton.visible = false

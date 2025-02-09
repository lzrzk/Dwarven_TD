extends Node2D
var crystal_scene = preload("res://Scenes/Towers/crystal_1.tscn")
var ballista_scene = preload("res://Scenes/Towers/ballista_1.tscn")
var statue_scene = preload("res://Scenes/Towers/statue_1.tscn")
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
	if Variables.ore >= 100:
		%towers.add_child(crystal)
		Variables.ore-=100
		queue_free()

func _on_ballista_button_pressed() -> void:
	var ballista=ballista_scene.instantiate()
	ballista.position = self.position
	if Variables.ore >= 100:
		%towers.add_child(ballista)
		Variables.ore-= 100
		queue_free()


func _on_statue_button_pressed() -> void:
	var statue=statue_scene.instantiate()
	statue.position = self.position
	if Variables.ore >= 100:
		%towers.add_child(statue)
		Variables.ore-= 100
		queue_free()


func _on_back_button_pressed() -> void:
	$ActivedButton.visible= true
	$CrystalButton.visible= false
	$BallistaButton.visible = false
	$StatueButton.visible = false
	$BackButton.visible = false

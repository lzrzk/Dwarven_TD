extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass




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
	var crystal_scene = preload("res://Scenes/Towers/crystal_1.tscn") as PackedScene
	var crystal=crystal_scene.instantiate()
	crystal.position = self.position
	if Variables.ore >= 100:
		add_sibling(crystal)
		Variables.ore-=100
		queue_free()

func _on_ballista_button_pressed() -> void:
	var ballista_scene = preload("res://Scenes/Towers/ballista_1.tscn") as PackedScene
	var ballista=ballista_scene.instantiate()
	ballista.position = self.position
	if Variables.ore >= 100:
		add_sibling(ballista)
		Variables.ore-= 100
		queue_free()


func _on_statue_button_pressed() -> void:
	var statue_scene = preload("res://Scenes/Towers/statue_1.tscn") as PackedScene
	var statue=statue_scene.instantiate()
	statue.position = self.position
	if Variables.ore >= 100:
		add_sibling(statue)
		Variables.ore-= 100
		queue_free()


func _on_back_button_pressed() -> void:
	$ActivedButton.visible= true
	$CrystalButton.visible= false
	$BallistaButton.visible = false
	$StatueButton.visible = false
	$BackButton.visible = false

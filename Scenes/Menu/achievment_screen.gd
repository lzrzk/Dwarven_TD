extends Node2D


func _ready() -> void:
	if $save_manager.save_arr[0] == "T":
		$Sprite2D.visible = true
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/Mainmenu.tscn")

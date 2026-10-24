extends Node


var Achievment_1_got = false 
var save


func _ready() -> void:
	
	if FileAccess.file_exists("res://Scenes/Menu/save Files.txt"):
		return
	var save_file = FileAccess.open("res://Scenes/Menu/save Files.txt", FileAccess.READ)
	save = save_file.get_as_text
	
	var save_arr
	for i in save:
		save_arr.append(save)
	if save_arr[0] == "T":
		pass
		
	if $save_manager.save_arr[0] == "T":
		$Sprite2D.visible = true
		



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/Mainmenu.tscn")

extends Tower
class_name balista
var arrow_scene = preload("res://Scenes/bullets/arrow.tscn")


func shoot():
	if len(self.enemiesInRange) == 0:
		return
	
	match self.target:
		"first":
			var arr = arrow_scene.instantiate()
			arr.enemy = self.enemiesInRange[0]
			arr.physical_dmg = physical_dmg
			arr.magical_dmg = magical_dmg
			add_child(arr)
		_:
			var arr = arrow_scene.instantiate()
			arr.enemy = self.enemiesInRange[0]
			arr.physical_dmg = physical_dmg
			arr.magical_dmg = magical_dmg
			add_child(arr)

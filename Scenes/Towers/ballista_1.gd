extends Tower
class_name balista
var arrow_scene = preload("res://Scenes/bullets/arrow.tscn")
var can_atack = false

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
		"trishot":
			print(1)
			if self.can_atack == true:
				if len(enemiesInRange) < 3:
					print(2)
					var arr = arrow_scene.instantiate()
					arr.enemy = self.enemiesInRange[0]
					arr.physical_dmg = physical_dmg*1.3
					arr.magical_dmg = magical_dmg*1.3
					add_child(arr)
				else:
					var arr1 = arrow_scene.instantiate()
					arr1.enemy = self.enemiesInRange[0]
					arr1.physical_dmg = physical_dmg/2
					arr1.magical_dmg = magical_dmg/2
					add_child(arr1)
					var arr2 = arrow_scene.instantiate()
					arr2.enemy = self.enemiesInRange[1]
					arr2.physical_dmg = physical_dmg/2
					arr2.magical_dmg = magical_dmg/2
					add_child(arr2)
					var arr3 = arrow_scene.instantiate()
					arr3.enemy = self.enemiesInRange[2]
					arr3.physical_dmg = physical_dmg/2
					arr3.magical_dmg = magical_dmg/2
					add_child(arr3)
		_:
			var arr = arrow_scene.instantiate()
			arr.enemy = self.enemiesInRange[0]
			arr.physical_dmg = physical_dmg
			arr.magical_dmg = magical_dmg
			add_child(arr)

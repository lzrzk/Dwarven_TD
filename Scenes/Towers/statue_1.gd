extends Tower
var statue_ham_scene = preload("res://Scenes/bullets/statue_hammer.tscn")

func shoot():
	if len(self.enemiesInRange) == 0:
		return
	
	match self.target:
		"first":
			var statue_ham = statue_ham_scene.instantiate()
			statue_ham.enemy = self.enemiesInRange[0]
			statue_ham.magical_dmg = self.magical_dmg
			statue_ham.physical_dmg = self.physical_dmg
			add_child(statue_ham)
			
		_:
			pass

extends Tower
var magic_arr_scene = preload("res://Scenes/bullets/magic_strike.tscn")

func shoot():
	if len(self.enemiesInRange) == 0:
		return
	
	match self.target:
		"first":
			var magic_arr = magic_arr_scene.instantiate()
			magic_arr.enemy = self.enemiesInRange[0]
			magic_arr.setDmg(physical_dmg,magical_dmg,fire_trough_ice)
			add_child(magic_arr)
			
		_:
			pass
		"tri-shot":
			var magic_arr_1 = magic_arr_scene.instantiate()
			magic_arr_1.enemy = self.enemiesInRange[0]
			magic_arr_1.setDmg(physical_dmg,magical_dmg,fire_trough_ice)
			add_child(magic_arr_1)
			var magic_arr_2 = magic_arr_scene.instantiate()
			magic_arr_2.enemy = self.enemiesInRange[1]
			magic_arr_2.setDmg(physical_dmg/2,magical_dmg/2,fire_trough_ice/2)
			add_child(magic_arr_2)
			var magic_arr_3 = magic_arr_scene.instantiate()
			magic_arr_3.enemy = self.enemiesInRange[2]
			magic_arr_3.setDmg(physical_dmg/3,magical_dmg/3,fire_trough_ice/3)
			add_child(magic_arr_3)

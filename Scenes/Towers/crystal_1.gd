extends Tower
var magic_arr_scene = preload("res://Scenes/bullets/magic_strike.tscn")

func shoot():
	if len(self.enemiesInRange) == 0:
		return
	
	match self.target:
		"first":
			var magic_arr = magic_arr_scene.instantiate()
			magic_arr.enemy = self.enemiesInRange[0]
			add_child(magic_arr)
			
		_:
			pass

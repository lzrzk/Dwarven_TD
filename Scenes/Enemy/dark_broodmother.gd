extends enemy

var dark_spawn = load("res://Scenes/Enemy/dark_spawn_sapwnable.tscn") as PackedScene



func _on_spawn_timer_timeout() -> void:
	var brood = dark_spawn.instantiate()
	Variables.enemies.add_child(brood)
	brood.pathFollow.progress = self.pathFollow.progress

'''
extends enemy

dark_spawn = load("res://Scenes/Enemy/dark_spawn_sapwnable.tscn") as PackedScene

func _ready() -> void:
		while true:
			$"../".add_child(dark_spawn)
			$SpawnTimer.start
			await $SpawnTimer.timeout
'''

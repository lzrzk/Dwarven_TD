@tool
class_name SingleWave
extends Resource

@export var Enemies:Array[EnemyInWave] = []

var currentEnemyInWaveID:int = -1

func get_current_enemy_waittime() -> int:
	return Enemies[currentEnemyInWaveID].WaitTime

func get_current_enemy_scene() -> PackedScene:
	return Enemies[currentEnemyInWaveID].scene

func next_enemy():
	if is_there_next_enemy():
		currentEnemyInWaveID += 1

func is_there_next_enemy() -> bool:
	return currentEnemyInWaveID + 1 != Enemies.size()



func get_wave_time() -> int:
	var sum :int = 0
	for e in Enemies:
		sum+=e.WaitTime
	return sum

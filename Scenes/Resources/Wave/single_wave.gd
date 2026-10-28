@tool
class_name SingleWave
extends Resource

@export var Enemies:Array[EnemyInWave] = []

var currentEnemyInWaveID:int = 0

func get_wave_time() -> int:
	var sum :int = 0
	for e in Enemies:
		sum+=e.WaitTime
	return sum

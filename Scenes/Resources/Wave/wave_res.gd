@tool
class_name WavesRes
extends Resource

@export var Waves:Array[SingleWave] = []

@export var TotalTime:int = get_all_waves_time()

func get_all_waves_time() -> int:
	var total = 0
	for w in Waves:
		total+= w.get_wave_time()
	return total

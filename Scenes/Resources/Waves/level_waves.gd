@tool
class_name LevelWaves
extends Resource
var curentWaveid = -1
#region Data
@export var Waves:Array[SingleWave] = []
#endregion

func get_current_wave() -> SingleWave:
	return Waves[curentWaveid]

func next_wave():
	if is_next_wave_possible():
		curentWaveid += 1

func is_next_wave_possible() -> bool:
	return Waves[curentWaveid + 1] != null


@export var TotalTime:int = get_all_waves_time()

func get_all_waves_time() -> int:
	var total = 0
	for w in Waves:
		total+= w.get_wave_time()
	return total

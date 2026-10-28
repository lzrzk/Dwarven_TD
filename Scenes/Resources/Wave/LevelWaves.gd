@tool
class_name LevelWaves
extends Resource

#region Data
@export var waves:Array[SingleWave] = []
var current_wave_id:int = -1
#endregion

#region Buisnes logic
func get_current_wave() -> SingleWave:
	return waves[current_wave_id]

func next_wave() -> void:
	if is_next_wave_exist():
		current_wave_id+=1

func is_next_wave_exist() -> bool:
	return current_wave_id < waves.size() -1

func get_all_waves_time() -> int:
	var total = 0
	for w in waves:
		total+= w.get_wave_time()
	return total

#endregion

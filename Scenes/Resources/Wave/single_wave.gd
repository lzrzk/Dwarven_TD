@tool
class_name SingleWave
extends Resource

#region Data
@export var enemies:Array[EnemyInWave] = []

var current_enemy_in_wave_id:int = -1
#endregion

#region Buisnes logic
func get_current_enemy_scene() -> PackedScene:
	return enemies[current_enemy_in_wave_id].scene

func get_current_enemy_wait_time() -> float:
	return enemies[current_enemy_in_wave_id].WaitTime
	
func get_current_enemy() -> EnemyInWave:
	return enemies[current_enemy_in_wave_id]

func next_enemy() -> void:
	if is_next_enemy_exist():
		current_enemy_in_wave_id+=1

func is_next_enemy_exist() -> bool:
	return current_enemy_in_wave_id < enemies.size() -1
#endregion

func get_wave_time() -> int:
	var sum :int = 0
	for e in enemies:
		sum+=e.WaitTime
	return sum

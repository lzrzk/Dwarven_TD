extends Node
var rat_scene = load("res://Scenes/Enemy/Rat.tscn") as PackedScene
var rat_light_scene = load("res://Scenes/Enemy/rat_light.tscn") as PackedScene
var rat_knight_scene = load("res://Scenes/Enemy/rat_knight.tscn") as PackedScene
var rat_king_scene = load("res://Scenes/Enemy/rat_king.tscn") as PackedScene
var stone_golemite_scene = load("res://Scenes/Enemy/rock_golemite.tscn") as PackedScene
var stone_golem_scene = load("res://Scenes/Enemy/rock_golem.tscn") as PackedScene
var crystal_golemite_scene = load("res://Scenes/Enemy/crystal_golemite.tscn") as PackedScene
var crystal_golem_scene = load("res://Scenes/Enemy/crystal_golem.tscn") as PackedScene
var dark_spawn_scene = load("res://Scenes/Enemy/dark_spawn.tscn") as PackedScene
var dark_abomination_scene = load("res://Scenes/Enemy/dark_abomination.tscn") as PackedScene
var dark_broodmother = load("res://Scenes/Enemy/dark_broodmother.tscn") as PackedScene
var rat_hound_scene = load("res://Scenes/Enemy/rat_hound.tscn") as PackedScene
var rat_hound_armoured_scene = load("res://Scenes/Enemy/rat_hound_armoured.tscn") as PackedScene
var rat_hound_mounted_scene = load("res://Scenes/Enemy/rat_hound_mounted.tscn") as PackedScene
var rat_hound_armoured_mounted_scene = load("res://Scenes/Enemy/rat_hound_armoured_mounted.tscn") as PackedScene
signal endwave
var enemy_types = [rat_scene,rat_light_scene,rat_knight_scene,rat_king_scene,stone_golemite_scene,stone_golem_scene,crystal_golemite_scene,crystal_golem_scene,dark_spawn_scene,dark_abomination_scene,dark_broodmother,rat_hound_scene,rat_hound_armoured_scene,rat_hound_mounted_scene,rat_hound_armoured_mounted_scene]
var wave:Array

var waves:Dictionary = {}
func _ready() -> void:
	'''
	rat...0
	rat light...1
	rat knight...2
	rat king...3 (BOSS)
	stone golemite...4
	stone golem...5 (MINIBOSS)
	crystal golemite...6
	crystal golem...7 (MINIBOSS)
	dark spawn...8
	dark abomination...9
	dark broodmother...10 (MINIBOSS)
	rat hound...11
	rat hound armoured...12
	rat on rat hound...13
	rat on rat hound armoured...14
	'''
	waves[0]= [[0,5]]
	waves[1]= [[0,3],[0,7],[0,6],[0,4]]
	waves[2]= [[0,3],[0,7],[0,6],[8,4],[0,7],[0,7]]
	waves[3]= [[8,4],[0,4],[8,4],[0,4],[0,5],[0,2],[0,7],[8,2],[8,3],[8,1],[8,5]]
	waves[4]= [[0,2],[4,10],[6,10]]
	waves[5]= [[1,3],[1,3],[1,3]]
	waves[6]= [[8,2],[0,2],[8,5],[0,2],[0,2],[8,5],[0,2],[8,2],[0,5],[0,2]]
	waves[7]= [[6,4],[4,7],[8,5],[9,4],[8,8],[8,3],[8,5]]
	waves[8]= [[0,2],[2,2],[0,2]]
	waves[9]= [[0,4],[2,4],[0,4],[2,4],[0,4]]
	waves[10]= [[11,5]]
	waves[11]= [[1,2],[2,2],[1,2]]
	waves[12]= [[3,10]]
	waves[13]= [[1,2],[0,3],[2,4],[0,3],[2,2],[11,5],[1,4],[0,3],[1,3],[0,5]]
	waves[14]= [[12,5]]
	waves[15]= [[4,3],[4,2],[4,1],[4,3],[4,6],[4,1]]
	waves[16]= [[5,5]]
	waves[17]= [[1,1],[1,2],[0,3],[2,3],[2,1],[12,5],[1,1],[2,2],[1,3],[1,1]]
	waves[18]= [[6,3],[6,5],[6,3],[6,1],[6,5],[6,1]]
	waves[19]= [[7,5]]
	waves[20]= [[9,1],[8,2],[9,3],[9,3],[8,1],[9,5],[9,1],[9,2],[8,3],[8,1]]
	waves[21]= [[10,10]]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func startWave():
	
	if Variables.waveNumber == 22:
		pass
	else:
		wave = waves[Variables.waveNumber]
		$EnemyTimer.start(wave[0][1])




func _on_enemy_timer_timeout() -> void:
	Variables.enemies.add_child(enemy_types[wave[0][0]].instantiate())
	wave.pop_front()
	if len(wave) > 0:
		$EnemyTimer.start(wave[0][1])
	else:
		Variables.waveNumber+=1
		endwave.emit()

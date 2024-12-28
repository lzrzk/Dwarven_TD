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

var enemy_types = [rat_scene,rat_light_scene,rat_knight_scene,rat_king_scene,stone_golemite_scene,stone_golem_scene,crystal_golemite_scene,dark_abomination_scene,dark_broodmother,rat_hound_scene,rat_hound_armoured_scene]
var waveNumber = 0
var waves:Dictionary = {}
func _ready() -> void:
	'''
	rat...1
	rat light...2
	rat knight...3
	rat king...4
	stone golemite...5
	stone golem...6
	crystal golemite...7
	crystal golem...8
	dark spawn...9
	dark abomination...10
	dark broodmother...11 
	rat hound...12
	rat hound armoured...13
	rat on rat hound...14 to do
	rat on rat hound armoured...15 to do
	'''
	waves[0]= [[0,5]]
	waves[1]= [[0,3],[0,7],[0,6],[0,4]]
	waves[2]= [[9,4],[0,4],[9,4],[0,4],[0,5],[0,2],[0,7],[9,2],[9,3],[9,1],[9,5]]
	waves[3]= [[0,2],[5,10],[7,10]]
	waves[4]= [[1,3],[1,3],[1,3]]
	waves[5]= [[9,2],[0,2],[9,5],[0,2],[0,2],[9,5],[0,2],[9,2],[0,5],[0,2]]
	waves[6]= [[7,4],[5,7],[9,5],[10,4],[9,8],[9,3],[9,5]]
	waves[7]= [[0,2],[2,2],[0,2]]
	waves[8]= [[0,4],[2,4],[0,4],[2,4],[0,4]]
	waves[9]= [[12,5]]
	waves[10]= [[1,2],[2,2],[1,2]]
	waves[11]= [[3,10]]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func startWave():
	
	var wave=waves[waveNumber]
	for pair in wave:
		var enemy_instance
		var waitTime = pair[1]
		var type = pair[0]
		if pair[0] < len(enemy_types):
			Variables.enemies.add_child(enemy_types[type].instantiate())
			wait(waitTime)
		waveNumber+=1
	



func wait(sec):
	$EnemyTimer.wait_time = sec
	$EnemyTimer.start()
	await $EnemyTimer.timeout
	print("next")

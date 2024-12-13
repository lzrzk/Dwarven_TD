extends Node
var rat_scene = load("res://Scenes/Enemy/Rat.tscn") as PackedScene
var rat_light_scene = load("res://Scenes/Enemy/rat_light.tscn") as PackedScene
var rat_knight_scene = load("res://Scenes/Enemy/rat_knight.tscn") as PackedScene
var rat_king_scene = load("res://Scenes/Enemy/rat_king.tscn") as PackedScene
var enemy_types = [rat_scene,rat_light_scene,rat_knight_scene,rat_king_scene]
var waveNumber = 0
var waves:Dictionary = {}
func _ready() -> void:
	'''
	rat...1
	rat light...2
	rat knight...3
	rat king...4
	'''
	waves[0]= [[0,5]]
	waves[1]= [[0,4],[0,4],[0,4],[0,4],[0,4]]
	waves[2]= [[1,4],[0,4],[0,4],[1,4]]
	waves[3]= [[1,3],[1,3],[1,3]]
	waves[4]= [[0,2],[0,2],[0,5],[0,2],[0,2],[0,5],[0,2],[0,2],[0,5],[0,2]]
	waves[5]= [[0,2],[2,2],[0,2]]
	waves[6]= [[0,4],[2,4],[0,4],[2,4],[0,4]]
	waves[7]= [[1,2],[2,2],[1,2]]
	waves[8]= [[3,10]]
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

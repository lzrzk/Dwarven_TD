extends Node
var ratSceen = load("res://Scenes/Enemy/Rat.tscn") as PackedScene
var waveNumber = 0
var waves:Dictionary = {}
func _ready() -> void:
	'''
	rat...1
	rat light...2
	rat knight...3
	rat king...4
	'''
	
	waves[0]= [[1,5],[1,5],[1,5]]
	waves[1]= [[1,4],[1,4],[1,4],[1,4],[1,4]]
	waves[2]= [[2,4],[1,4],[1,4],[2,4]]
	waves[3]= [[2,3],[2,3],[2,3]]
	waves[4]= [[1,2],[1,2],[1,5],[1,2],[1,2],[1,5],[1,2],[1,2],[1,5],[1,2]]
	waves[5]= [[1,2],[3,2],[1,2]]
	waves[6]= [[1,4],[3,4],[1,4],[3,4],[1,4]]
	waves[7]= [[2,2],[3,2],[2,2]]
	waves[8]= [[4,10]]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func startWave():
	var wave=waves[waveNumber]
	for pair in wave:
		var waitTime=pair[1]
		if pair[0] == 1:
			var rat = ratSceen.instantiate()
			Variables.enemies.add_child(rat)
		if pair[0] == 2:
			var rat = ratSceen.instantiate()
			Variables.enemies.add_child(rat)
		if pair[0] == 3:
			var rat = ratSceen.instantiate()
			Variables.enemies.add_child(rat)
		if pair[0] == 4:
			var rat = ratSceen.instantiate()
			Variables.enemies.add_child(rat)
		wait(waitTime)
	waveNumber+=1
	



func wait(sec):
	$EnemyTimer.wait_time = sec
	$EnemyTimer.start()
	await $EnemyTimer.timeout
	print("next")

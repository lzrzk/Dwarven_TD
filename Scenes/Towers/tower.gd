extends Node
class_name Tower
@export var price:int
@export var range:int
@export var physical_dmg:int
@export var magical_dmg:int
@export var attack_speeds:float
@export var target:String


var enemiesInRange = []

func _process(delta: float) -> void:
	if len(enemiesInRange) > 0 and $attackTimer.time_left == 0:
		$attackTimer.start()



func _on_attack_range_area_entered(area: Area2D) -> void:
	if area.type == "enemy":
		enemiesInRange.append(area)


func _on_attack_range_area_exited(area: Area2D) -> void:
	if area.type == "enemy":
		enemiesInRange.erase(area)

func shoot():
	if self.target == "first" and len(enemiesInRange) > 0:
		enemiesInRange[0].hit(self.physical_dmg,self.magical_dmg,0)

extends Node
class_name Tower
@export var price:int
@export var range:int
@export var physical_dmg:float
@export var magical_dmg:float
@export var attack_speeds:float
@export var target:String
@export var enemiesInRange:Array

func _process(delta: float) -> void:
	if len(self.enemiesInRange) > 0 and $attackTimer.time_left == 0:
		$attackTimer.start()



func _on_attack_range_area_entered(area: Area2D) -> void:
	print("ON GUARD")
	if area.type == "enemy":
		self.enemiesInRange.append(area)
		print(self.enemiesInRange)

func _on_attack_range_area_exited(area: Area2D) -> void:
	print("OFF GUARD")
	if area.type == "enemy":
		self.enemiesInRange.erase(area)

func shoot():
	if self.target == "first" and len(self.enemiesInRange) > 0:
		self.enemiesInRange[0].hit(self.physical_dmg,self.magical_dmg,0)




func _on_activate_button_pressed() -> void:
	$ActivateButtonpass.visible = false
	$BackButton.visible = true
	$UpgradeButton.visible = true
func _on_back_button_pressed() -> void:
	$ActivateButtonpass.visible = true
	$BackButton.visible = false
	$UpgradeButton.visible = false

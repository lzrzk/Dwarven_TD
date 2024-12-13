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


func shoot():
	if self.target == "first" and len(self.enemiesInRange) > 0:
		self.enemiesInRange[0].hit(self.physical_dmg,self.magical_dmg,0)




func _on_activate_button_pressed() -> void:
	$ActivateButton.visible = false
	$BackButton.visible = true
	$UpgradeButton.visible = true
func _on_back_button_pressed() -> void:
	$ActivateButton.visible = true
	$BackButton.visible = false
	$UpgradeButton.visible = false


func _on_attack_range_body_exited(body: Node2D) -> void:
	print("OFF GUARD")
	if body.type == "enemy":
		self.enemiesInRange.erase(body)
func _on_attack_range_body_entered(body: Node2D) -> void:
	print("ON GUARD")
	if body.type == "enemy":
		self.enemiesInRange.append(body)
		print(self.enemiesInRange)

func _on_upgrade_button_pressed() -> void:
	var up_tower= self.upgraded_tower.instantiate()
	up_tower.position = self.position
	if Variables.ore >= 100:
		$up_tower.add_child(up_tower)
		Variables.ore-=100
		queue_free()

extends Node
class_name Tower
@export var price:int
@export var fire_trough_ice:int
@export var range:int
@export var physical_dmg:float
@export var magical_dmg:float
@export var attack_speeds:float
@export var target:String
@export var enemiesInRange:Array
@export var upgraded_tower:PackedScene
@export var upgraded_tower2:PackedScene
@onready var type = "tower"


func _process(delta: float) -> void:
	if len(self.enemiesInRange) > 0 and $attackTimer.time_left == 0:
		$attackTimer.start()
	$attackTimer.wait_time = self.attack_speeds

func shoot():
	if len(self.enemiesInRange) == 0:
		return
	
	match self.target:
		"first":
			self.enemiesInRange[0].hit(self.physical_dmg,self.magical_dmg,self.fire_trough_ice,0)
		_:
			self.enemiesInRange[0].hit(self.physical_dmg,self.magical_dmg,0)
			print("insuficient target")
		"tri-shot":
			self.enemiesInRange[0].hit(self.physical_dmg,self.fire_trough_ice,self.magical_dmg,0)
			self.enemiesInRange[1].hit(self.physical_dmg/2,self.fire_trough_ice,self.magical_dmg/2,0)
			self.enemiesInRange[2].hit(self.physical_dmg/3,self.fire_trough_ice,self.magical_dmg/3,0)
		"piercing":
			self.enemiesInRange[0].hit(self.physical_dmg/2,self.magical_dmg/2,self.fire_trough_ice,self.magical_dmg/2 + self.physical_dmg/2)
			



func _on_activate_button_pressed() -> void:
	$ActivateButton.visible = false
	$BackButton.visible = true
	if upgraded_tower != null:
		$UpgradeButton.visible = true
	Variables.selectedNode = self
	if upgraded_tower2 != null:
		$UpgradeButton2.visible = true

func _on_back_button_pressed() -> void:
	$ActivateButton.visible = true
	$BackButton.visible = false
	$UpgradeButton.visible = false
	$UpgradeButton2.visible = false

func _ready() -> void:
	var range_shape = CircleShape2D.new()
	range_shape.radius = self.range * 10   #ConversionRate
	$Attack_range/CollisionShape2D.shape = range_shape



func _on_attack_range_body_exited(body: Node2D) -> void:
	if body.type == "enemy":
		self.enemiesInRange.erase(body)
func _on_attack_range_body_entered(body: Node2D) -> void:
	if body.type == "enemy":
		self.enemiesInRange.append(body)
		print(self.enemiesInRange)

func _on_upgrade_button_pressed() -> void:
	var up_tower= self.upgraded_tower.instantiate()
	up_tower.position = self.position
	if Variables.ore >= self.price:
		$"../".add_child(up_tower)
		Variables.ore-=self.price
		queue_free()

func _on_upgrade_button_2_pressed() -> void:
	var up_tower= self.upgraded_tower2.instantiate()
	up_tower.position = self.position
	if Variables.ore >= self.price:
		$"../".add_child(up_tower)
		Variables.ore-=self.price
		queue_free()
func _on_activate_button_mouse_entered() -> void:
	$Polygon2D.visible = true

func _on_activate_button_mouse_exited() -> void:
	$Polygon2D.visible = false


func _on_sell_button_pressed() -> void:
	var picker = "res://Scenes/Towers/towerPicker.tscn"
	$"../".add_child(picker.instantiate())
